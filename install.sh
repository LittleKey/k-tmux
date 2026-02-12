#!/bin/bash

set -xe

CURRENT_DIR=$(pwd)

if [ -d ${HOME}/.tmux ]; then
	today=$(date +%Y%m%d)
	if $FOR_VIM; then
		for i in ${HOME}/.tmux.conf ${HOME}/.tmux; do [ -e $i ] && [ ! -L $i ] && mv -f $i $i.$today; done
		for i in ${HOME}/.tmux.conf ${HOME}/.tmux; do [ -L $i ] && unlink $i; done
	fi
fi
mkdir -p ${HOME}/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo 'exit 0' >>~/.tmux/plugins/tpm/tpm

ln -f ${CURRENT_DIR}/tmux.conf ${HOME}/.tmux.conf
ln -sf ${HOME}/.tmux ${HOME}/.config/tmux
ln -f ${HOME}/.tmux.conf ${HOME}/.config/tmux/tmux.conf

# install plugin and reload config
tmux run-shell "${HOME}/.tmux/plugins/tpm/bindings/install_plugins"
