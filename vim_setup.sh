#!/bin/bash
pathogen="https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

curl "$pathogen" > vim/.vim/autoload/pathogen.vim
