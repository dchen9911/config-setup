#!/bin/sh
CFG_DIR=$HOME/config-setup
cd $HOME
if ! [ -f .vimrc ]; then 
    echo Adding link for vimrc 
    ln -sf $CFG_DIR/.vimrc .vimrc
fi

if ! [ -f .zshrc ]; then 
    echo Adding link for zshrc 
    ln -sf $CFG_DIR/.zshrc .zshrc
fi

if ! [ -f .profile ]; then 
    echo Adding link for profile 
    ln -sf $CFG_DIR/.profile .profile
fi

if ! [ -d scripts ]; then 
    echo Adding link for scripts
    ln -sf $CFG_DIR/scripts scripts
fi


if [ -f .cfg ]; then 
    echo Adding link for logid 
    sudo ln -sf $CFG_DIR/logid.cfg /etc/logid.cfg
fi

if [ -d "$HOME/.config/Code/User" ]; then 
    echo "Adding vscode json link"
    ln -sf $CFG_DIR/vscode-settings.json .config/Code/User/settings.json 
else
    echo "vscode not installed"
fi


