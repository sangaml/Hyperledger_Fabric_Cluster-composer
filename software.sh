#!/bin/bash
#install git
wget https://raw.githubusercontent.com/sangaml/Hyperledger_Fabric_Cluster-composer/master/blockchain.sh
chmod +x blockchain.sh
cp blockchain.sh /home/admin123/
sudo apt install git -y
#install golang
wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
tar -xvf go1.9.2.linux-amd64.tar.gz
sudo mv go /usr/local/
mkdir go-dir
export GOROOT=/usr/local/go
export GOPATH=$HOME/go-dir
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
sudo echo "export GOROOT=/usr/local/go
export GOPATH=$HOME/go-dir
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.profile
#install Docker and docker composer

sudo add-apt-repository    "deb https://packages.docker.com/1.12/apt/repo/ \
ubuntu-$(lsb_release -cs) \
main"
sudo apt-get update
sudo apt-get -y install docker-engine --allow-unauthenticated
sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose
#Install nvm
sudo -i -u admin123 exec "./blockchain.sh"
