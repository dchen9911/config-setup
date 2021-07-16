#!/bin/sh
DOTFILES_DIR=$HOME/config-setup/dotfiles
CFGFILES_DIR=$HOME/config-setup/configs
CFG_DIR=$HOME/config-setup

cd $HOME

if ! [ -f .vimrc ]; then 
    echo Adding link for vimrc 
    ln -sf $DOTFILES_DIR/.vimrc .vimrc
else
    echo "vimrc already exists so skipping link creation"
fi

if ! [ -f .zshrc ]; then 
    echo Adding link for zshrc 
    ln -sf $DOTFILES_DIR/.zshrc .zshrc
else
    echo "zshrc already exists so skipping link creation"
fi

if ! [ -f .profile ]; then 
    echo Adding link for profile 
    ln -sf $DOTFILES_DIR/.profile .profile
else
    echo "bash profile already exists so skipping link creation"
fi

if ! [ -d scripts ]; then 
    echo Adding link for scripts
    ln -sf $CFG_DIR/scripts scripts
else
    echo "scripts folder already exists so skipping link creation"
fi

if ! [ -f /etc/logid.cfg ]; then 
    echo Adding link for logid 
    sudo ln -sf $CFGFILES_DIR/logid.cfg /etc/logid.cfg
else
    echo "/etc/logid.cfg already exists so skipping link creation"
fi

if ! [ -f "$HOME/.config/Code/User/settings.json" ]; then 
    if [ -d "$HOME/.config/Code/User/settings.json" ]; then
        echo VScode not installed, please install and then rerun the script
    else
        echo "Adding vscode json link"
	mkdir -p .config/Code/User
        ln -sf $CFGFILES_DIR/vscode-settings.json .config/Code/User/settings.json 
    fi
else
    echo "vscode settings.json already exists so skipping link creation" 
fi


if ! [ -f "$HOME/.vim/coc-settings.json" ]; then 
    echo Adding link coc-settings.json
    sudo ln -sf $CFGFILES_DIR/coc-settings.json "$HOME/.vim/coc-settings.json"
else
    echo "coc-settings.json already exists so skipping"
fi

if ! [ -f "$HOME/.imwheelrc" ]; then 
    echo Adding link .imwheelrc 
    sudo ln -sf $DOTFILES_DIR/.imwheelrc "$HOME/.imwheelrc"
else
    echo ".imwheelrc already exists so skipping"
fi
