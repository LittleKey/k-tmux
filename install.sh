#!/bin/bash

CURRENT_DIR=$(dirname "$0")

if [ -d ${HOME}/.tmux ];
then
    mv ${HOME}/.tmux ${HOME}/.tmux.bak
fi
git submodule update --init --recursive
mkdir -p ${HOME}/.tmux/plugins
ln -sf ${CURRENT_DIR}/tpm ${HOME}/.tmux/plugins/tpm

ln -f ${CURRENT_DIR}/tmux.conf ${HOME}/.tmux.conf

