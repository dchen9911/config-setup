#!/bin/bash
CFG_DIR=$HOME/config-setup
cd $HOME
ln -sf $CFG_DIR/.vimrc .vimrc
ln -sf $CFG_DIR/.zshrc .zshrc
ln -sf $CFG_DIR/vscode-settings.json .config/Code/User/settings.json 
sudo ln -sf $CFG_DIR/logid.cfg /etc/logid.cfg
