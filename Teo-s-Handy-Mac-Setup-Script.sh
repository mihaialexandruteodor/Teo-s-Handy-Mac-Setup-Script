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


echo -e "Installing Cocoa Pods\n"
echo -e "You'll need to type in your password below\n"

sudo gem install cocoapods
clear

brew install -y nano
clear

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

echo -e "Setting up window tiling manager... \n"
brew install -y koekeishiya/formulae/yabai
rm -f "${HOME}"/.{chunkwm,skhd}rc
git clone https://github.com/mihaialexandruteodor/chunkwm-yabai-config.git "${HOME}"/.config/chunkwm
ln -s "${HOME}/.config/chunkwm/chunkwm/chunkwmrc" "${HOME}/.chunkwmrc"
ln -s "${HOME}/.config/chunkwm/chunkwm/skhdrc" "${HOME}/.skhdrc"
clear

allOptions=( Docker VirtualBox VSCode R latest-version-openjdk Eclipse JavaFX-Scene-Builder Sublime-Text Spotify VLC SmartGit Transmission Chrome Gradle mpich)

echo "First, tell me what optional apps you want:"

read -n 1 -s -r -p "Press any key to continue"
clear

selectedOptions=()

print_options(){
   echo "Do you want to install $1 ? Type y or Y for yes, anything else for no"
   read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        selectedOptions+=($1)
    fi
    clear
}

for i in ${!allOptions[@]};
do
  opt=${allOptions[$i]}
  print_options $opt
done

#Docker
if [[ " ${selectedOptions[@]} " =~ "Docker" ]]; then
    brew install -y docker
    brew install -y docker-machine
    brew cask install -y virtualbox
    docker-machine create --driver virtualbox default
    clear
fi

#SmartGit
if [[ " ${selectedOptions[@]} " =~ "SmartGit" ]]; then
   brew cask install -y smartgit
   clear
fi

#VirtualBox
if [[ " ${selectedOptions[@]} " =~ "VirtualBox" ]]; then
   
fi

#VSCode
if [[ " ${selectedOptions[@]} " =~ "VSCode" ]]; then
   brew tap homebrew/cask
   brew cask install -y visual-studio-code
   clear
fi

#R
if [[ " ${selectedOptions[@]} " =~ "R" ]]; then
   brew install -y r
   clear
fi


#latest-version-openjdk
if [[ " ${selectedOptions[@]} " =~ "latest-version-openjdk" ]]; then
   echo -e "You'll need to type in your password a little later\n"
   brew cask install -y adoptopenjdk
   clear
fi

#Eclipse
if [[ " ${selectedOptions[@]} " =~ "Eclipse" ]]; then
   brew cask install -y eclipse-jee
   clear
fi

#JavaFX-Scene-Builder
if [[ " ${selectedOptions[@]} " =~ "JavaFX-Scene-Builder" ]]; then
   brew cask install -y scenebuilder
   clear
fi

#Sublime-Text
if [[ " ${selectedOptions[@]} " =~ "Sublime-Text" ]]; then
   brew cask install -y sublime-text
   clear
fi

#Spotify
if [[ " ${selectedOptions[@]} " =~ "Spotify" ]]; then
   brew install -y homebrew/cask/brew-cask 2> /dev/null
   brew cask install -y spotify
   clear
fi

#VLC
if [[ " ${selectedOptions[@]} " =~ "VLC" ]]; then
   brew cask install -y vlc
   clear
fi


#Transmission
if [[ " ${selectedOptions[@]} " =~ "Transmission" ]]; then
   brew cask install -y transmission
   clear
fi

#Chrome
if [[ " ${selectedOptions[@]} " =~ "Chrome" ]]; then
   brew cask install -y google-chrome
   clear
fi

#Gradle
if [[ " ${selectedOptions[@]} " =~ "Gradle" ]]; then
   brew install -y gradle
fi

#mpich
if [[ " ${selectedOptions[@]} " =~ "mpich" ]]; then
   brew install -y mpich
   clear
fi


echo -e "Alright, that should be all for now! Enjoy your new Mac, and if this was usefull, go to https://github.com/mihaialexandruteodor/Teo-s-Handy-Mac-Setup-Script and star this repo ;) \n\n"
