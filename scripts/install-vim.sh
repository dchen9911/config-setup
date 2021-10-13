#!/bin/sh

echo "---------- Installing vim now ---------------"


DOTFILES_DIR=$HOME/config-setup/dotfiles

# install the latest version of vim 
if vim --version | head -n 4 | grep "Vi IMproved 8" ; then
    echo "Vim is version 8 so skipping"
else
    # install vim 8.2 (or whatever the latest version is)
    echo "Installing latest version of vim"
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt update
    sudo apt install -y vim    
    echo "Done installing"
fi

# install vim plug
if ! [ -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "installing vim plug"
    curl -fLo  ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "vim-plug already install so skipping"
fi

if ! command -v node; then
    echo "Installing nodejs"
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "nodejs already installed"
fi

if ! command -v clangd; then
    echo "Installing clangd"
    sudo apt install -y clangd
else
    echo "clangd already installed"
fi

if ! [ dpkg --list | grep "vim-gnome" ]; then
    echo "installing vim-gnome"
    sudo apt install -y vim-gnome
else
    echo "vim-gnome already installed"
fi

if ! [ -f .vimrc ]; then 
    echo Adding link for vimrc 
    ln -sf $DOTFILES_DIR/.vimrc .vimrc
else
    echo "vimrc already exists so skipping link creation"
fi

echo "----------- Installing vim plugins + extensions ---------------"
# finally install the plugins
vim +PlugInstall +qall

# actually finally install the extensions to coc
vim +"CocInstall -sync coc-pyright coc-clangd coc-sh coc-prettier" +qall
