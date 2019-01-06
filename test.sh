#!/bin/bash
#install git
sudo apt install git -y
#install golang
sudo -i -u admin123 bash -c 'wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz'
sudo -i -u admin123 bash -c 'tar -xvf go1.9.2.linux-amd64.tar.gz'
sudo -i -u admin123 bash -c 'sudo mv go /usr/local/'
sudo -i -u admin123 bash -c 'mkdir go-dir'
sudo -i -u admin123 bash -c 'export GOROOT=/usr/local/go'
sudo -i -u admin123 bash -c 'export GOPATH=$HOME/go-dir'
sudo -i -u admin123 bash -c 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH'
sudo -i -u admin123 bash -c 'sudo echo "export GOROOT=/usr/local/go
export GOPATH=$HOME/go-dir
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.profile'
#install Docker and docker composer
curl -fsSL 'https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e' | sudo apt-key add -
sudo add-apt-repository    "deb https://packages.docker.com/1.12/apt/repo/ \
ubuntu-$(lsb_release -cs) \
main"
sudo apt-get update
sudo apt-get -y install docker-engine
sudo -i -u admin123 bash -c 'sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)"'
sudo -i -u admin123 bash -c 'sudo chmod +x /usr/local/bin/docker-compose'
#Install nvm

sudo -i -u admin123 bash -c 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash'
sudo -i -u admin123 bash -c 'export NVM_DIR="$HOME/.nvm"'
sudo -i -u admin123 bash -c '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
sudo -i -u admin123 bash -c '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
restart
sleep 2m
sudo -i -u admin123 bash -c 'nvm install v8.9 -y'
#Install node and npm
sudo -i -u admin123 bash -c 'sudo apt install node-gyp -y'
sudo -i -u admin123 bash -c 'npm install -g composer-cli'
sudo -i -u admin123 bash -c 'npm install -g generator-hyperledger-composer'
sudo -i -u admin123 bash -c 'npm install -g yo'
sudo -i -u admin123 bash -c 'npm install -g composer-playground'
#Start Docker Containers

sudo -i -u admin123 bash -c 'curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.zip'
sudo -i -u admin123 bash -c 'sudo apt install unzip -y'
sudo -i -u admin123 bash -c 'unzip fabric-dev-servers.zip'
sudo -i -u admin123 bash -c 'sudo ./downloadFabric.sh'
sudo -i -u admin123 bash -c 'sudo ./startFabric.sh'
sudo -i -u admin123 bash -c './createPeerAdminCard.sh'
sudo -i -u admin123 bash -c 'composer-playground &'
