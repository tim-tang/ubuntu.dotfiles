#!/bin/sh
#Authore: tim.tang

## - Install preparation.

#  - Upgrade system

sudo apt-get update
sudo apt-get upgrade

# - Generate ssh-key
echo -e "\n"|ssh-keygen -t rsa -C "tang.jilong@139.com"
echo "Press Enter Key to Continue..." && read

# - Authenticate ssh-key with GitHub
echo "Authenticate With GitHub..." && yes|ssh -T git@github.com

## TODO: checking continue or abort installation. 

## - Install Git 

## - Install Oh-My-ZSH

## - Install CoreUtils

## - Install MIsc

## - Install MongoDB

## - Install NodeJS

## - Housekeeping
cp gnzh.zsh-theme ~/.oh-my-zsh/themes/
source ~/.zshrc
sudo shutdown 0  -r
