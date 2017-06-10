#!/bin/bash

CURRENT_DIR=$(dirname "$0")

if [ -d ${HOME}/.tmux ];
then
    mv -f ${HOME}/.tmux ${HOME}/.tmux.bak
fi
git submodule update --init --recursive
mkdir -p ${HOME}/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -f ${CURRENT_DIR}/tmux.conf ${HOME}/.tmux.conf

