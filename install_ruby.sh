#!/bin/bash

echo "===> Installing RVM >>"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

echo '===> Installing requirements'
rvm requirements

echo '===> Installing Ruby 2.4.1'
rvm install 2.4.1

echo '===> Setting default to 2.4.1'
rvm use 2.4.1 --default

gem install bundler -V --no-ri --no-rdoc
