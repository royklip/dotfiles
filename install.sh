#!/bin/sh

# Update system
sudo apt-get -y update
sudo apt-get -y upgrade

# Install git
sudo apt -y install curl git wget zsh nano python3-pip python3.12-venv direnv

# Set default shell to ZSH
chsh -s $(which zsh)

# Install Oh My ZSH
sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Create ssh key
ssh-keygen -t ed25519 -C "royklip2@gmail.com" -f "$HOME/.ssh/id_ed25519" -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Add ssh key to Github
read -p "Enter a title for the key: " title
read -p "Enter github personal access token: " githubpat
pub=`cat ~/.ssh/id_ed25519.pub`
curl -u "royklip:$githubpat" -X POST -d "{\"title\":\"$title\",\"key\":\"$pub\"}" https://api.github.com/user/keys

# Install ZSH plugins and theme
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Create projects directory
mkdir ~/projects
cd ~/projects

# Clone the dotfiles repo
git clone git@github.com:royklip/dotfiles.git
cd dotfiles

# Create symlinks to home folder
rm ~/.zshrc
ln -s ~/projects/dotfiles/runcom/.zshrc ~/.zshrc
ln -s ~/projects/dotfiles/runcom/.p10k.zsh ~/.p10k.zsh
ln -s ~/projects/dotfiles/git/.gitconfig ~/.gitconfig
