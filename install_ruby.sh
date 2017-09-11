#!/bin/bash

sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
sudo source ~/.rvm/scripts/rvm
sudo rvm requirements && sudo rvm install 2.4.1 && sudo rvm use 2.4.1 --default
gem install bundler -V --no-ri --no-rdoc
ruby -v
