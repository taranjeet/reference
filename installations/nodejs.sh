# ubuntu installation
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
ln -s /usr/bin/nodejs /usr/bin/node
# http://stackoverflow.com/questions/26320901/cannot-install-nodejs-usr-bin-env-node-no-such-file-or-directory
echo "##################### NODE.JS INSTALLED SUCCESSFULLY ################"