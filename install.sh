#!/bin/sh

echo
echo -e "\033[0;34m**********************************\033[0m"
echo -e "\033[0;34m*** Finiks' dotfiles installer ***\033[0m"
echo -e "\033[0;34m**********************************\033[0m"
echo
echo -e "\033[0;33m    |\033[0m You are about to overwrite every configuration files that might interfere with mine."
echo -e "\033[0;33m/!\\ |\033[0m Make sure that you have already made the necessary backups."
while true; do
    echo -ne "\033[0;33m    |\033[0m "
    read -p "Do you wish to continue? [Y/n] " INPUT
    case $INPUT in
        [Yy]*)
            break
            ;;
        [Nn]*)
            exit
            ;;
    esac
done

# todo: package installation
echo
echo "Installing the adblock plus dwb plugin..."
dwbem -i adblock_subscriptions

echo
echo "Cloning oh-my-zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo
echo "Cloning zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins

echo
ITEMS="config compton.conf irssi mpdconf ncmpcpp rtorrent.rc vim vimrc Xdefaults xinitrc zshrc"
for ITEM in $ITEMS; do
    echo "Removing any .$ITEM that might exist..."
    rm -Rf ~/.$ITEM
    echo "Linking .$ITEM to the home directory..."
    ln -sf ~/dotfiles/$ITEM ~/.$ITEM
    echo
done

echo -e "\033[0;33m/!\\ \033[0mDon't forget to create a config file for mpdas!"
echo -e "\033[0;33m/!\\ \033[0mDon't forget to enable cronie.service!"

echo
echo "** All done! **"
