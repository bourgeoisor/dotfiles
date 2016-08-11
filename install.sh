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

echo
echo "Adding multilib to pacman.conf..."
sudo sh -c '{ echo "[multilib]" >> /etc/pacman.conf; }'
sudo sh -c '{ echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf; }'

echo
echo "Installing xorg and the WM..."
sudo pacman -Sy bspwm sxhkd xorg-server xorg-server-utils xorg-xinit xf86-video-intel

echo
echo "Installing utils..."
sudo pacman -Sy alsa-utils dunst ifplugd otf-ipafont numlockx terminus-font ttf-dejavu wpa_actiond zsh

echo
echo "Installing tool applications..."
sudo pacman -Sy figlet htop mlocate openssh ranger tmux scrot tree xclip

echo
echo "Installing multimedia applications..."
sudo pacman -Sy feh mpc mpd mplayer ncmpcpp

echo
echo "Installing dev applications and utils..."
sudo pacman -Sy go vim

echo
echo "Installing TeX..."
sudo pacman -S texlive-most texlive-lang texmaker

echo
echo "Installing misc applications..."
sudo pacman -Sy irssi mupdf picard steam

echo
echo "Installing AUR exclusive packages..."
yaourt -S compton
yaourt -S lemonbar-git
yaourt -S mpdas
yaourt -S rxvt-unicode-pixbuf
yaourt -S rtorrent-color
yaourt -S qutebrowser

echo
echo "Cloning oh-my-zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo
echo "Cloning zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

ITEMS="config compton.conf irssi mpdconf ncmpcpp rtorrent.rc vim vimrc Xdefaults xinitrc zshrc"
for ITEM in $ITEMS; do
    echo
    echo "Removing any .$ITEM that might exist..."
    rm -Rf ~/.$ITEM
    echo "Linking .$ITEM to the home directory..."
    ln -sf ~/dotfiles/$ITEM ~/.$ITEM
done

echo
echo "Touching required files for mpd..."
mkdir -p ~/.mpd/playlists
touch ~/.mpd/database
touch ~/.mpd/log

echo
echo "Enabling cronie..."
sudo systemctl enable cronie

echo
echo "Updating crontab..."
crontab ~/.config/crontab.conf

echo
echo "Changing shell for zsh..."
chsh -s /bin/zsh

echo
echo -e "\033[0;33m/!\\ \033[0mDon't forget to create a config file for mpdas!"

echo
echo "** All done! A reboot is recommended. **"
