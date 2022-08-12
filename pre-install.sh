#!/bin/sh

# Update system
sudo apt-get -y update
sudo apt-get -y upgrade

# Install git
sudo apt -y install curl git

# Create ssh key
ssh-keygen -t ed25519 -C "royklip2@gmail.com"
ssh-add ~/.ssh/id_ed25519

# Add ssh key to Github
read -p "Enter a title for the key: " title
read -p "Enter github personal access token: " githubpat
pub=`cat ~/.ssh/id_ed25519.pub`
curl -u "royklip:$githubpat" -X POST -d "{\"title\":\"$title\",\"key\":\"$pub\"}" https://api.github.com/user/keys

# Create projects directory
mkdir ~/projects
cd ~/projects

# Clone the dotfiles repo
git clone git@github.com:royklip/dotfiles.git
cd dotfiles