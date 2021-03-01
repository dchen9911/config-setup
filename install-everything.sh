#!/bin/sh
CFG_DIR=$HOME/config-setup

# install VSCode
if ! command -v code; then
    cd /tmp
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

    sudo apt install -y apt-transport-https
    sudo apt update
    sudo apt install -y code 
fi 

# install logid
if ! command -v logid; then
    sudo apt install -y cmake libevdev-dev libudev-dev libconfig++-dev
    cd /tmp
    git clone https://github.com/PixlOne/logiops
    cd logiops
    mkdir build
    cd build
    cmake ..
    make
    sudo make install
fi

if ! [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    # setup Vundle for vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install ohmyzsh
if ! command -v zsh; then
    sudo apt install zsh
    chsh -s $(which zsh)
    cd /tmp
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    sh install.sh
    # install required fonts
    sudo apt install -y fonts-powerline
    sudo apt install -y autojump 
fi

# setup the symbolic links
sh $CFG_DIR/setup_links.sh

# install required vim plugins
vim +PluginInstall +qall


if ! command -v conda; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh
fi

# install rclone and rclonesync TODO: automate rclone setup
if ! command -v rclone; then
    curl https://rclone.org/install.sh | sudo bash
fi

if [ -f "$HOME/.local/bin/rclonesync" ]; then
    cd $HOME/.local/bin/rclonesync 
    wget https://raw.githubusercontent.com/cjnaz/rclonesync-V2/master/rclonesync
fi

# install expect modules for ansible
#sudo apt install -y python3-pexpect
#sudo apt install -y expect
