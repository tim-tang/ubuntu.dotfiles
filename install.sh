#!/bin/sh
# Author: Tim.Tang

## - Install Git 
function installGIt(){
    echo "Installing Git."
    yes|sudo apt-get install git-core    
    echo "GIt core successfully installed!"
}

## - Install CoreUtils
function installCoreUtils(){
    echo "Installing CoreUtils."
    wget http://zwicke.org/web/advcopy/advcpmv-0.5-8.21-static.tar.xz
    tar xvJf advcpmv-0.5-8.21-static.tar.xz
    sudo cp advcpmv-0.5-8.21-static/cp /usr/local/bin/cp
    sudo cp advcpmv-0.5-8.21-static/mv /usr/local/bin/mv
    echo "CoreUtils successfully installed!"
}

## - Install MIsc
function installMisc(){
    echo "Installing Misc tools."
    yes|sudo apt-get install htop 
    yes|sudo apt-get install curl 
    yes|sudo apt-get install openssh-server 
    yes|sudo apt-get install vim
    echo "Misc tools successfully installled!"
}

## - Install MongoDB
function installMongodb(){
    echo "Installing MongoDB."
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
    sudo apt-get update
    yes|sudo apt-get install mongodb-10gen
    echo "MongoDB successfully installled!"
}

## - Install NodeJS
function installNode(){
    echo "Install NodeJs."
    sudo apt-get install python-software-properties
    yes|sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    yes|sudo apt-get install nodejs
    echo "NodeJS successfully installed!"
}

## - Install Oh-My-Zsh
function installOhMyZsh(){
    echo "Installing Oh-My-Zsh."
    cd $HOME
    yes|sudo apt-get install zsh
    wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    chsh -s $(which zsh)
    echo "Oh-My-Zsh succefully installed!"
}

## - Link dotfiles
function doSymbolLink(){
    echo "Installing symbol links."
    cd -
    # Warning may be not working in bash.
    for link_file ($PWD/*.symlink); do
        FILENAME=${link_file##*/}
        ln -s -i -v $link_file $HOME/.${FILENAME%.*}
    done
    echo "Symbol links successfully generated!"
}

## - Housekeeping
function doHouseKeeping(){
    cp -r -f $PWD/gnzh.zsh-theme $HOME/.oh-my-zsh/themes/
    sudo mkdir -p /opt/oracle
    sudo cp -r -f tnsnames.ora /opt/oracle/
    source $HOME/.zshrc
    sudo shutdown 0  -r
}

##===========================ACTUAL RUNNING ========================##

## - Install preparation.
#  - Upgrade system
sudo apt-get update
sudo apt-get upgrade

# - Generate ssh-key
echo -e "\n"|ssh-keygen -t rsa -C "tang.jilong@139.com"
echo "Press Enter Key to Continue..." && read

# - Authenticate ssh-key with GitHub
echo "Authenticate With GitHub..." && yes|ssh -T git@github.com

# - Checking Continue|Abort installation. 
read -p "Are you alright? (y/n) " RESP
if [ "$RESP" = "y" ]; then
    echo "Glad to hear it!"
    installGIt()
    installCoreUtils()
    installMisc()
    installMongodb()
    installNode()
    installOhMyZsh()
    doSymbolLink()
    doHouseKeeping()
else
    echo "Abort ubuntu dotfiles installation!"
fi
