#!/bin/bash


if [ -d ${HOME}/.tmux ];
then
    mv ${HOME}/.tmux ${HOME}/.tmux.bak
fi
git submodule update --init --recursive
mkdir -p ${HOME}/.tmux/plugins
ln -sf `pwd`/tpm ${HOME}/.tmux/plugins/tpm

ln -f `pwd`/tmux.conf ${HOME}/.tmux.conf

