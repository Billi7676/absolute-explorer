#!/bin/bash
# Download latest node and install.
abslink=`curl -s https://api.github.com/repos/absolute-community/absolute/releases/latest | grep browser_download_url | grep x86_64-linux | cut -d '"' -f 4`
version=`curl -s https://api.github.com/repos/absolute-community/absolute/releases/latest | grep tag_name | grep v | cut -d '"' -f 4`
versionsh=${version:1:7}
sudo apt-get update -y -qq
sudo apt-get upgrade -y -qq
sudo apt-get install software-properties-common -y -qq
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y -qq	
sudo apt-get install nano htop -y -qq
sudo apt-get install pwgen  -y -qq	
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y -qq
sudo apt-get install tmux  -y -qq
sudo apt-get install libevent-pthreads-2.0-5 -y -qq
sudo apt-get install libboost-all-dev -y -qq
sudo apt-get install libzmq3-dev -y -qq
sudo apt-get install libminiupnpc-dev -y -qq
sudo apt install virtualenv -y -qq

mkdir -p /tmp/absolute
cd /tmp/absolute
curl -Lo absolute.tar.gz $abslink
tar -xzf absolute.tar.gz
sudo mv ./absolutecore-0.$versionsh/bin/* /usr/local/bin
cd
rm -rf /tmp/absolute
mkdir ~/.absolutecore

# Setup configuration for node.
rpcuser=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')
rpcpassword=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo '')
cat >~/.absolutecore/absolute.conf <<EOL
rpcuser=$rpcuser
rpcpassword=$rpcpassword
daemon=1
txindex=1
EOL

# Start node.
absoluted
