#!/bin/sh

CFG_DIR=$HOME/config-setup
cd $HOME

if [ -h .vimrc ]; then 
    echo Removing link for vimrc 
    rm .vimrc
elif [ -f .vimrc ]; then 
    echo ".vimrc exists, please delete/backup and run this again"
fi

if [ -h .zshrc ]; then 
    echo Removing link for zshrc 
    rm .zshrc
elif [ -f .zshrc ]; then 
    echo ".zshrc exists, please delete/backup and run this again"
fi

if [ -h .profile ]; then 
    echo Removing link for profile 
    rm .profile
elif [ -f .profile ]; then 
    echo ".profile exists, please delete/backup and run this again"
fi

if [ -h scripts ]; then 
    echo Removing link for scripts
    rm scripts
elif [ -d scripts ]; then 
    echo "scripts folder exists, please delete/backup and run this again"
fi

if [ -h /etc/logid.cfg ]; then 
    echo Removing link for logid 
    sudo rm /etc/logid.cfg
elif [ -f /etc/logid.cfg ]; then 
    echo "logid.cfg exists, please delete/backup and run this again"
fi

if [ -h "$HOME/.config/Code/User/settings.json" ]; then 
    echo "Removing vscode json link"
    rm .config/Code/User/settings.json 
elif [ -f "$HOME/.config/Code/User/settings.json" ]; then 
    echo "VSCode settings.json exists, please delete/backup and run this again"
fi


