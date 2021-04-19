#! /bin/bash
sudo apt-get update -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt install openjdk-11-jdk -y
sudo apt-get update -y
sudo apt install jenkins -y
sudo service jenkins start

sudo apt-get update -y
sudo apt-get install docker.io -y

sudo apt-get update -y
sudo docker run -d --name webapp --restart=always -p200:80 jmugu/dockerapp
sudo usermod -aG docker jenkins
sudo reboot
sudo apt-get update -y
sudo service docker start


