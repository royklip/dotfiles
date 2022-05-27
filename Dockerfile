FROM ubuntu:20.04

RUN apt-get update && apt-get -y install sudo

# Install packages
RUN apt -y install wget git zsh nano
# RUN chsh -s $(which zsh)
# RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
# Remove password requirement for sudo
# RUN docker ALL=(ALL) NOPASSWD:ALL

USER docker

WORKDIR /home/docker/.dotfiles
COPY . .

CMD ["/bin/bash"]
# sh install.sh