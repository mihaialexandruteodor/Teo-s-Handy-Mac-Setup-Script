#!/bin/bash

clear

echo -e "\n"
echo "Teo's Handy Mac Setup Script.sh"
echo -e "Mihai Alexandru Teodor ©2020\n"

echo -e "################################################################\n\n"

echo -e "I'll guide you all the way, remember that shell execution can be interrupted by pressing Ctrl+Z\n"

echo "First we'll install Homebrew, the Mac package manager"
echo -e "Note that Xcode Dev Tools will also be installed, which include gcc and are usefull is you want to use CLion or QT Creator to develop C++ apps\n"
echo -e "You'll need to type in your password below\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


echo -e "Setting up Nano...\n"
echo "set constantshow" >> ~/.nanorc
clear
echo "set linenumbers" >> ~/.nanorc
clear
echo "include \"/usr/local/share/nano/*.nanorc\"" >> ~/.nanorc
clear

echo -e "Setting up Git... \n"
brew install git
clear

echo -e "Do you want to install Visual Studio Code? y/n \n"
read answer
clear
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "Installing Visual Studio Code...\n"
    brew tap homebrew/cask
    brew cask install visual-studio-code
else
    echo -e "Alright, moving on...\n"
fi

echo -e "Do you want to install the latest version of Java? y/n \n"
read answer
clear
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "Installing the latest version of Java...\n"
    echo -e "You'll need to type in your password below\n"
    brew cask install adoptopenjdk
else
    echo -e "You might have Java already installed, I guess\n"
fi

echo -e "Do you want to install Eclipse IDE? y/n \n"
read answer
clear
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "Installing Eclipse IDE...\n"
    brew cask install eclipse-jee
else
    echo -e "If it's not needed, we're moving on to the next...\n"
fi

echo -e "Do you want to JavaFX Scene Builder? y/n \n"
read answer
clear
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "Installing JavaFX Scene Builder...\n"
    brew cask install scenebuilder
else
    echo -e "Skipping this...\n"
fi

echo -e "Sublime is an awesome text editor! Wanna try it? y/n \n"
read answer
clear
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "Installing Sublime Text...\n"
    brew cask install sublime-text
else
    echo -e "Forget Sublime...\n"
fi


echo -e "What's programming without a little music?\n\n"
echo -e "Do you want to install Spotify? y/n \n"
read answer
clear
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo -e "Installing Spotify...\n"
    brew install caskroom/cask/brew-cask 2> /dev/null
    brew cask install spotify
else
    echo -e "Music is for tools...\n"
fi


