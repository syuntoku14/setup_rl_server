#!/bin/bash  

sudo apt update && sudo apt upgrade -y

# install tmux and mosh
sudo apt install tmux mosh

# install docker
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker

sudo apt install -y python3-pip

# install xvfb and opengl
sudo apt install -y python-opengl xvfb

# install doceker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

echo "if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then" >> ~/.bashrc
echo "    . /opt/local/etc/profile.d/bash_completion.sh" >> ~/.bashrc
echo "fi" >> ~/.bashrc

source ~/.bashrc

# Enable to use docker without sudo
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker

exit
