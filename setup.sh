#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Vim
ln -s ${BASEDIR}/vimrc ~/.vimrc

# tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
