#!/bin/sh

install_path="$HOME/.vim/pack/plugins/start/vim-terraform"

if [ ! -d "$install_path" ]; then
    git clone https://github.com/hashivim/vim-terraform.git "$install_path"
else
    cd "$install_path"
    git pull origin master
fi
