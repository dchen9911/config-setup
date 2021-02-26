#!/bin/sh
CFG_DIR=$HOME/config-setup
cd $HOME
ln -sf $CFG_DIR/.vimrc .vimrc
ln -sf $CFG_DIR/.zshrc .zshrc
sudo ln -sf $CFG_DIR/logid.cfg /etc/logid.cfg

if test -d "$HOME/.config/Code/User"; then 
    ln -sf $CFG_DIR/vscode-settings.json .config/Code/User/settings.json 
else
    echo "vscode not installed"
fi


