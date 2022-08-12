FROM ubuntu:20.04

# Install sudo
RUN apt-get update && apt-get -y install sudo

# Create docker user: password "docker"
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# Remove password requirement for sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

WORKDIR /home/docker
COPY pre-install.sh .

CMD [ "/bin/sh", "pre-install.sh"]