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

# Launch conky
conky

# Launch mpd
mpd &

# Disable the touchpad
synclient TouchpadOff=1

# Puts numlock on
numlockx &

# Launch the input manager
#ibus-daemon --xim &

exec awesome
#sxhkd &
#exec bspwm
