#!/bin/sh
CFG_DIR=$HOME/config-setup

# for spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -

# install ckb-next for resizing terminal
if ! command -v ckb-next; then
    echo "Installing ckb-next"
    sudo apt install -y ckb-next
else
    echo ckb-next already installed
fi

# install ckb-next for resizing terminal
if ! command -v imwheel; then
    echo "Installing imwheel"
    sudo apt install -y imwheel
else
    echo imwheel already installed
fi

# install VSCode
if ! command -v code; then
    echo "Installing VSCode"
    cd /tmp
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

    sudo apt install -y apt-transport-https
    sudo apt update
    sudo apt install -y code
else
    echo "VSCode already installed"
fi

# install xterm for resizing terminal
if ! command -v resize; then
    echo "Installing xterm"
    sudo apt install -y xterm
else
    echo xterm already installed
fi

if ! command -v curl; then
    echo "Installed curl"
    sudo apt install -y curl
else
    echo curl already installed
fi

if ! command -v "typora"; then 
    echo "Installing typora"
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    sudo add-apt-repository 'deb https://typora.io/linux ./' -y
    sudo apt-get update
    sudo apt-get install typora -y
else
    echo typora already installed
fi

if ! command -v "g++"; then
    echo "Installing g++"
    sudo apt install g++ -y
else
    echo g++ already installed
fi

# install logid
if ! command -v logid; then
    echo "Installing logid"
    sudo apt install -y cmake libevdev-dev libudev-dev libconfig++-dev
    cd /tmp
    git clone https://github.com/PixlOne/logiops
    cd logiops
    mkdir build
    cd build
    cmake ..
    make
    sudo make install
else
    echo "logid already installed"
fi

# install rclone and rclonesync TODO: automate rclone setup
if ! command -v rclone; then
    echo Installing rclone
    curl https://rclone.org/install.sh | sudo bash
else
    echo rclone already installed
fi

if ! [ -f "$HOME/.local/bin/rclonesync" ]; then
    echo Installing rclonesync
    mkdir -p $HOME/.local/bin
    cd $HOME/.local/bin 
    wget https://raw.githubusercontent.com/cjnaz/rclonesync-V2/master/rclonesync
    chmod +x rclonesync 
else
    echo rclonesync already installed
fi

sh $CFG_DIR/scripts/install_zsh.sh

sh $CFG_DIR/scripts/unlink.sh

echo "---------- Installing vim now ---------------"
sh $CFG_DIR/scripts/install-vim.sh


echo "-----------Linking files now ---------------"
sh $CFG_DIR/scripts/setup-links.sh


echo "----------- Installing vim plugins + extensions ---------------"
# finally install the plugins
vim +PlugInstall +qall

# actually finally install the extensions to coc
vim +"CocInstall -sync coc-pyright coc-clangd coc-sh coc-prettier" +qall

# also load in the terminal settings TODO: change this to compare modify dates
dconf load /org/gnome/terminal/legacy/profiles:/ < $CFG_DIR/gnome-terminal-profiles.dconf


if ! command -v conda; then
    echo "Installing mambaforge"
    cd /tmp
    wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
    bash Mambaforge-Linux-x86_64.sh
    # set conda to not be auto activated
    conda config --set auto_activate_base false
else
    echo Miniconda already installed
fi


# install expect modules for ansible
#sudo apt install -y python3-pexpect
#sudo apt install -y expect
