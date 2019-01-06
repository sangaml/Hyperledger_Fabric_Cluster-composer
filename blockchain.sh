curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
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
nohup composer-playground &
exit
