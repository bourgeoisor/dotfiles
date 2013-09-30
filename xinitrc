#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Rehash the fonts
xset +fp /usr/share/fonts/local
xset fp rehash
setxkbmap -option grp:caps_toggle us,ca

# Cursor
xsetroot -cursor_name left_ptr &

# Background
hsetroot -tile /home/finiks/pictures/wallpapers/nyaruko.png

# Compton
compton -cCb -fD 2 -r r -o 0.5 -l 2 -t 2 &

# Unclutter
unclutter -grab -noevents -root &

# Launch conky
#conky

# Launch mpd
mpd &

# Disable the touchpad
synclient TouchpadOff=1

# Puts numlock on
numlockx &

# Launch the input manager
#ibus-daemon --xim &

# Launch bspwm
sxhkd &
exec bspwm
