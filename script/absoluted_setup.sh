#!/bin/bash
# Download latest node and install.
abslink=`curl -s https://api.github.com/repos/absolute-community/absolute/releases/latest | grep browser_download_url | grep linux64 | cut -d '"' -f 4`
mkdir -p /tmp/absolute
cd /tmp/absolute
curl -Lo absolute.tar.gz $abslink
tar -xzf absolute.tar.gz
sudo mv ./bin/* /usr/local/bin
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