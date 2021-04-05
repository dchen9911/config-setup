#!/bin/sh

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
     ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "vim-plug already install so skipping"
fi

if ! command -v node; then
    echo "Installing nodejs"
    sudo apt install -y nodejs
else
    echo "nodejs already installed"
fi

# finally install the plugins
vim +PlugInstall +qall

# actually finally install the extensions to coc
vim +"CocInstall coc-pyright coc-clangd coc-sh coc-prettier" +qall

