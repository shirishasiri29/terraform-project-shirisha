#!/bin/bash

mkdir /root/dir1

sudo apt-get update
sudo apt-get install apache2 -y

sudo git clone https://github.com/amolshete/card-website.git
sudo cp -rf card-website/* /var/www/html