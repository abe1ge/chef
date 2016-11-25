#!/usr/bin/env bash

echo "base bootstrap"

#update
sudo apt-get update -y && sudo apt-get upgrade -y

#add DNS CNAME of master to master and agents to /etc/hosts



