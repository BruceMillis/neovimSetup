#!/bin/bash/env

echo "REQUIRED OR STABLE PACKAGE INSTALLATION?"

read yOrN

if [ "$yOrN" = "y" ] || [ $yOrN = "Y" ];
then
    sudo apt-get update
    sudo apt-get install -y npm
    sudo apt-get install -y git
fi

echo "NEOVIM INSTALLATION?"

read yOrN

if [ "$yOrN" = 'y' ] || [ "$yOrN" = 'Y' ];
then
    NVIM_FILE=$XDG_CONFIG_HOME/nvim 
    if [ $(dpkg-query -W -f='${Status}' neovim 2>/dev/null | grep -c "ok installed") -eq 0 ];
    then
        sudo add-apt-repository ppa:neovim-ppa/unstable
        sudo apt-get update
        sudo apt-get install -y neovim
    fi
fi

echo "TMUX INSTALLATION?"

read yOrN

if [ "$yOrN" = 'y' ] || [ "$yOrN" = 'Y' ];
then
    sudo apt-get install -y tmux   
fi



