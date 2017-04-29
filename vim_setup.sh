#!/bin/bash
pathogen="https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

mkdir vim/.vim/autoload
curl "$pathogen" > vim/.vim/autoload/pathogen.vim
