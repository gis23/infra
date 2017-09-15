#!/bin/bash


echo "===> Installing RVM >>"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"

echo '===> Installing requirements'
rvm requirements

echo '===> Installing Ruby 2.4.1'
rvm install 2.4.1

echo '===> Setting default to 2.4.1'
rvm use 2.4.1 --default

gem install bundler -V --no-ri --no-rdoc


echo '===> Installing MongoDB'

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt-get update && sudo apt-get install -y mongodb-org
sudo systemctl enable mongod && sudo systemctl start mongod

echo '===> Deploying puma server'

git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
puma -d
