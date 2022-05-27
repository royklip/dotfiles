# Update system
sudo apt-get -y update
sudo apt-get -y upgrade

# Install wget, git and ZSH
sudo apt -y install wget git zsh nano

# Set default shell to ZSH
sudo chsh -s $(which zsh)

# Install Oh My ZSH
sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install ZSH plugins and theme
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy config files to home folder
cp ~/.dotfiles/runcom/.bash_profile ~
cp ~/.dotfiles/runcom/.zshrc ~
cp ~/.dotfiles/runcom/.p10k.zsh ~
cp ~/.dotfiles/git/.gitconfig ~