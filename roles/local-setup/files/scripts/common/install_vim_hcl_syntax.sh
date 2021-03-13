#!/bin/sh

mkdir -p "$HOME/.vim/pack/jvirtanen/start"
cd "$HOME/.vim/pack/jvirtanen/start"

if [ ! -d "vim-hcl" ]; then
    git clone git://github.com/jvirtanen/vim-hcl.git
else
    cd vim-hcl
    git pull origin master
fi
