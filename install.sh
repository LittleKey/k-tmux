#!/bin/bash

CURRENT_DIR=$(dirname "$0")

if [ -d ${HOME}/.tmux ];
then
  today=`date +%Y%m%d`
  if $FOR_VIM; then
    for i in ${HOME}/.tmux.conf ${HOME}/.tmux; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
    for i in ${HOME}/.tmux.conf ${HOME}/.tmux ; do [ -L $i ] && unlink $i ; done
  fi
fi
mkdir -p ${HOME}/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo 'exit 0' >> ~/.tmux/plugins/tpm/tpm

ln -f ${CURRENT_DIR}/tmux.conf ${HOME}/.tmux.conf

# install plugin and reload config
tmux run-shell "${HOME}/.tmux/plugins/tpm/bindings/install_plugins"
