#!/bin/bash
#install git
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
curl -fsSL 'https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e' | sudo apt-key add -
sudo add-apt-repository    "deb https://packages.docker.com/1.12/apt/repo/ \
ubuntu-$(lsb_release -cs) \
main"

sudo apt-get update
sudo apt-get -y install docker-engine
sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose
#Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
echo "[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"" >> ~/.bashrc
nvm install v8.9 -y
#Install node
sudo apt install node-gyp -y
npm install -g composer-cli
npm install -g generator-hyperledger-composer
npm install -g yo
npm install -g composer-playground
#Start Docker Containers
curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.zip
sudo apt install unzip -y
unzip fabric-dev-servers.zip
sudo ./downloadFabric.sh
sudo ./startFabric.sh
./createPeerAdminCard.sh
composer-playground
