#!/bin/bash

USERNAME=$(whoami)

sudo apt update
sudo apt upgrade -y
sudo apt install acl -y

# install docker
mkdir temp
curl -fsSL https://get.docker.com -o ./temp/get-docker.sh
sudo sh ./temp/get-docker.sh
sudo adduser $USERNAME docker

# tool install
mkdir /home/$USERNAME/.local/bin -p
chmod +x ./bin/*
cp ./bin/* /home/$USERNAME/.local/bin/
echo "export PATH=\":/home/$USERNAME/.local/bin\"" >> /home/$USERNAME/.bashrc

# create and template dockerdir
mkdir /home/$USERNAME/docker
mkdir /home/$USERNAME/docker/appdata
mkdir /home/$USERNAME/docker/compose
sudo mkdir /media
cp ./compose/* /home/$USERNAME/docker/compose/
cp -r ./appdata/* /home/$USERNAME/docker/appdata/
cp ./docker-compose.yml /home/$USERNAME/docker/docker-compose.yml
cp ./.env /home/$USERNAME/docker/.env

# permissions fuckery
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/docker
sudo chmod 775 /home/$USERNAME/docker
sudo setfacl -Rdm u:$USERNAME:rwx /home/$USERNAME/docker
sudo setfacl -Rm u:$USERNAME:rwx /home/$USERNAME/docker
sudo setfacl -Rdm g:docker:rwx /home/$USERNAME/docker
sudo setfacl -Rm g:docker:rwx /home/$USERNAME/docker
sudo chown $USERNAME:$USERNAME /media
sudo chmod 775 /media
sudo setfacl -Rdm u:$USERNAME:rwx /media
sudo setfacl -Rm u:$USERNAME:rwx /media
sudo setfacl -Rdm g:docker:rwx /media
sudo setfacl -Rm g:docker:rwx /media
