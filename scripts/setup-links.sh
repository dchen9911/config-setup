#!/bin/sh
CFG_DIR=$HOME/config-setup
cd $HOME

if ! [ -f .vimrc ]; then 
    echo Adding link for vimrc 
    ln -sf $CFG_DIR/.vimrc .vimrc
else
    echo "vimrc already exists so skipping link creation"
fi

if ! [ -f .zshrc ]; then 
    echo Adding link for zshrc 
    ln -sf $CFG_DIR/.zshrc .zshrc
else
    echo "zshrc already exists so skipping link creation"
fi

if ! [ -f .profile ]; then 
    echo Adding link for profile 
    ln -sf $CFG_DIR/.profile .profile
else
    echo "bash profile already exists so skipping link creation"
fi

if ! [ -d scripts ]; then 
    echo Adding link for scripts
    ln -sf $CFG_DIR/scripts scripts
else
    echo "scripts folder already exists so skipping link creation"
fi

if [ -f /etc/logid.cfg ]; then 
    echo Adding link for logid 
    sudo ln -sf $CFG_DIR/logid.cfg /etc/logid.cfg
else
    echo "/etc/logid.cfg already exists so skipping link creation"
fi

if [ -d "$HOME/.config/Code/User" ]; then 
    echo "Adding vscode json link"
    ln -sf $CFG_DIR/vscode-settings.json .config/Code/User/settings.json 
else
    echo "vscode not installed, please install and then rerun the script"
fi


