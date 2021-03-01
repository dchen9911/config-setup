#!/bin/sh
CFG_DIR=$HOME/config-setup
cd $HOME
ln -sf $CFG_DIR/.vimrc .vimrc
ln -sf $CFG_DIR/.zshrc .zshrc
ln -sf $CFG_DIR/.profile .profile
ln -sf $CFG_DIR/scripts scripts
sudo ln -sf $CFG_DIR/logid.cfg /etc/logid.cfg

if [ -d "$HOME/.config/Code/User" ]; then 
    ln -sf $CFG_DIR/vscode-settings.json .config/Code/User/settings.json 
else
    echo "vscode not installed"
fi


