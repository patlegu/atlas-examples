#!/bin/bash

set -ex

CONSUL_VERSION=0.5.2

sudo apt-get -y update

# install dependencies
echo "Installing dependencies..."
sudo apt-get install -y unzip
sudo apt-get install -y curl

# install consul
echo "Fetching consul..."
cd /tmp/
wget -q https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_linux_amd64.zip -O consul.zip

echo "Installing consul..."
unzip consul.zip
rm consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
sudo mkdir -m 0600 /etc/consul.d

# setup consul directories
sudo mkdir -m 0600 -p /opt/consul
sudo mkdir /opt/consul/data
sudo mkdir /opt/consul/web

# install consul-web
echo "Fetching consul-web..."
wget -q https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_web_ui.zip -O consul-web.zip
unzip consul-web.zip
rm consul-web.zip
sudo mv dist/* /opt/consul/web
rm -r dist

echo "Consul installation complete."
