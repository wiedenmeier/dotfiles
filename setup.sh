#!/bin/bash

error() {
    echo "$@" 1>&2
    exit 1
}

setup() {
    # ensure stow is installed
    which stow ||
        sudo apt-get install stow ||
        error "GNU stow not available"
}

usage() {
    cat <<EOF
Usage: ${0##*/} [options] module ...

    automatically set up system 'module' using configured dotfiles

    options:
        -c  checkout repo submodules before taking any action
        -f  force overwrite a dotfile that already exists
EOF
}

bad_usage() {
    usage 1>&2
    exit 1
}

main() {
    # FIXME: these should be changed to get abs path
    cwd="$(dirname ${0})"
    target_dir="$cwd/.."

    # parse args
    opts="fc"
    getopt_out=$(getopt --name "${0##*/}" \
        --options "${opts}" -- "${@}") &&
        eval set -- "${getopt_out}" ||
        bad_usage

    # init flags
    checkout=false
    force=false

    # read flag values
    while [ ${#} -ne 0 ]; do
        case ${1} in
            -c) checkout=true; shift;;
            -f) force=true; shift;;
            --) shift; break;;
        esac
    done

    # get module names
    modules=( "$@" )
    [ ${#modules[@]} -eq 0 ] && bad_usage

    # setup system
    setup > /dev/null

    # checkout submodules if needed
    if $checkout; then
        git submodule update --init --recursive
    fi

    # set up modules
    for module in "${modules[@]}"; do
        # ensure valid module
        [ -d "$module" ] || error "module: $module does not exist"

        # run setup script if any
        local setup_script="${module}_setup.sh"
        if [ -x "$setup_script" ]; then
            "$cwd/$setup_script" || error "script failed: $setup_script"
        fi

        # if force set, delete any possible conflicts
        if $force; then
            for file in $(ls -a "$module"); do
                [ "$file" = "." -o "$file" = ".." ] && continue;
                local path="$target_dir/$file"
                echo "warning, removing: $file"
                rm -rf "$path"
            done
        fi

        # stow the module
        stow "$module" || error "stow failed for module: $module"
    done

    exit 0
}

main "$@"
