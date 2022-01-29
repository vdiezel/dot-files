#!/bin/bash

# This script serves to setup a vim development environment for
# javascript using vims built in package management too

# 1. create the directories for swap, backup and undo

mkdir -p ~/.vim/undo ~/.vim/swap ~/.vim/backup

# 2. create the directory for package

# all packages are loaded on start
# bundle jsut serves for organization

mkdir -p ~/.vim/pack/bundle/start

# 3. get all packages from git

# Silversurfer requires ag installed

sudo apt-get install silversearcher-ag
git clone https://github.com/rking/ag.vim ~/.vim/pack/bundle/start/ag.vim

# ALE
git clone https://github.com/dense-analysis/ale.git ~/.vim/pack/bundle/start/ale

# FZF
sudo apt-get install fzf
# git clone https://github.com/junegunn/fzf.vim.git ~/.vim/pack/bundle/start/fzf.vim
git clone https://github.com/junegunn/fzf ~/.fzf && cd ~/.fzf && ./install

# rest
git clone https://github.com/sainnhe/gruvbox-material.git ~/.vim/pack/bundle/start/gruvbox-material
git clone https://github.com/othree/javascript-libraries-syntax.vim.git ~/.vim/pack/bundle/start/javascript-libraries-syntax.vim
git clone https://github.com/itchyny/lightline.vim.git ~/.vim/pack/bundle/start/lightline.vim
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/bundle/start/nerdtree
git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/pack/bundle/start/vim-better-whitespace
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/bundle/start/vim-fugitive
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/bundle/start/vim-gitgutter
git clone https://github.com/nathanaelkane/vim-indent-guides.git ~/.vim/pack/bundle/start/vim-indent-guides
git clone https://github.com/pangloss/vim-javascript.git ~/.vim/pack/bundle/start/vim-javascript
git clone https://github.com/mxw/vim-jsx.git ~/.vim/pack/bundle/start/vim-jsx
git clone https://github.com/sheerun/vim-polyglot.git ~/.vim/pack/bundle/start/vim-polyglot
git clone https://github.com/tpope/vim-surround.git ~/.vim/pack/bundle/start/vim-surround
git clone https://github.com/vim-test/vim-test.git ~/.vim/pack/bundle/start/vim-test

