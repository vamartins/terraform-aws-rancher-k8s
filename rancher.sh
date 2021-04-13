#!/bin/bash
sudo apt-get update -y
sudo curl https://releases.rancher.com/install-docker/19.03.sh | sh
sudo usermod -aG docker ubuntu
sudo apt-get install git -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose