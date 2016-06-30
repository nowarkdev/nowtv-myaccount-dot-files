#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Vim
ln -s ${BASEDIR}/vimrc ~/.vimrc

# Tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf

# Download iTerm Pencil Dark Theme
wget https://raw.githubusercontent.com/mattly/iterm-colors-pencil/master/pencil-dark.itermcolors

# Download Pencil Vim colours 
wget https://raw.githubusercontent.com/reedes/vim-colors-pencil/master/colors/pencil.vim -P ~/.vim/colors/
