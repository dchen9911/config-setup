DOTFILES_DIR=$HOME/config-setup/dotfiles
CFG_DIR=$HOME/config-setup

# install ohmyzsh
if ! command -v zsh; then
    echo "Installing zsh"
    sudo apt install -y zsh

    # add zsh to list of shells 
    command -v zsh | sudo tee -a /etc/shells
    sudo chsh -s "$(command -v zsh)" "${USER}" 
    
    cd /tmp
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    sh install.sh
    # install required fonts/features
    sudo apt install -y fonts-powerline
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/themes/powerlevel10k

    # install additional features
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    sudo apt install -y autojump
else
    echo "zsh already installed"
fi

if ! [ -f .zshrc ]; then 
    echo Adding link for zshrc 
    ln -sf $DOTFILES_DIR/.zshrc $HOME/.zshrc
else
    echo "zshrc already exists so skipping link creation"
fi