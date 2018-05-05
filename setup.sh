#!/bin/bash

error() {
    echo "$@" 1>&2
    exit 1
}

setup() {
    # update package lists
    sudo apt-get update
}

install_packages() {
    xargs -a <(grep '^\s*[^#]' "${1}") -- sudo apt-get install -y
}

usage() {
    cat <<EOF
Usage: ${0##*/} [options] module ...

    automatically set up system 'module' using configured dotfiles

    options:
        -c  checkout repo submodules before taking any action
        -e  install extra useful packages
        -f  force overwrite a dotfile that already exists
EOF
}

bad_usage() {
    usage 1>&2
    exit 1
}

main() {
    # parse args
    local opts="fce"
    local getopt_out=$(getopt --name "${0##*/}" \
        --options "${opts}" -- "${@}") &&
        eval set -- "${getopt_out}" ||
        bad_usage

    # init flags
    local checkout=false
    local extra_pkgs=false
    local force=false

    # read flag values
    while [ ${#} -ne 0 ]; do
        case ${1} in
            -c) checkout=true; shift;;
            -e) extra_pkgs=true; shift;;
            -f) force=true; shift;;
            --) shift; break;;
        esac
    done

    # get module names
    local modules=( "$@" )
    [ ${#modules[@]} -eq 0 ] && bad_usage

    # get base dir location
    local base_dir="${HOME}/dotfiles"
    local target_dir="$base_dir/.."

    # setup system
    local global_pkg_file="$base_dir/packages"
    setup && install_packages "$global_pkg_file" ||
        error "system setup failed"

    if $extra_pkgs; then
        local extra_pkg_file="$base_dir/extra_packages"
        install_packages "$extra_pkg_file" ||
            error "could not install extra packages"
    fi

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
            "$base_dir/$setup_script" || error "script failed: $setup_script"
        fi

        # install package requiements if any
        local package_file="${module}_packages"
        if [ -e "$package_file" ]; then
            install_packages "$package_file" ||
                error "package installation failed"
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

    return 0
}

main "$@"
