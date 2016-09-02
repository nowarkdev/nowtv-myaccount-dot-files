#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Vim
ln -s ${BASEDIR}/vimrc ~/.vimrc

# Tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf

# Copy theme to ~/.vim/colors
mkdir ~/.vim/colors/
cp ${BASEDIR}/Tomorrow-Night-Eighties.vim ~/.vim/colors/

echo "You must apply the Tomrrow-Night-Eighties iTerm2 theme ( located in the project root ) in order for the colours to work correctly."
