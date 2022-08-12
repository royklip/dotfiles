#!/bin/sh

# Update system
sudo apt-get -y update
sudo apt-get -y upgrade

# Install packages
sudo apt -y install wget zsh nano python3-pip python3.8-venv

# Set default shell to ZSH
sudo chsh -s $(which zsh)

# Install Oh My ZSH
sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install ZSH plugins and theme
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Create symlinks to home folder
ln -s ~/projects/dotfiles/runcom/.bash_profile ~/.bash_profile
ln -s ~/projects/dotfiles/runcom/.zshrc ~/.zshrc
ln -s ~/projects/dotfiles/runcom/.p10k.zsh ~/.p10k.zsh
ln -s ~/projects/dotfiles/git/.gitconfig ~/.gitconfig