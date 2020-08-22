#!/bin/bash

clear

echo -e "\n"
echo "Teo's Handy Mac Setup Script.sh"
echo -e "Mihai Alexandru Teodor ©2020\n"

echo -e "################################################################\n\n"

echo -e "I'll guide you all the way, remember that shell execution can be interrupted by pressing Ctrl+Z\n"

echo "First we'll install Homebrew, the Mac package manager"
echo -e "You'll need to type in your password below\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


echo -c "Setting up Nano...\n"
echo "set constantshow" >> ~/.nanorc
echo "set linenumbers" >> ~/.nanorc
echo "include \"/usr/local/share/nano/*.nanorc\"" >> ~/.nanorc

echo -e "Do you want to install Visual Studio Code? y/n \n"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "Installing Visual Studio Code...\n"
    brew tap caskroom/cask
    brew cask search visual-studio-code
    brew cask install visual-studio-code
else
    echo -e "Alright, moving on...\n"
fi

