#!/usr/bin/env bash

[ ! -f ~/.vimrc ] && ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
[ ! -f ~/.config/i3/config ] && ln -s ~/dotfiles/i3/config ~/.config/i3/config
[ ! -d ~/.config/nvim ] && mkdir -p ~/.config/nvim
[ ! -f ~/.config/nvim/init.vim ] && ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

