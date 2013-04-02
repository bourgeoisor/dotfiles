#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#rehash the fonts
xset +fp /usr/share/fonts/local
xset fp rehash
setxkbmap -option grp:caps_toggle us,ca

#launch conky
conky

#disable the touchpad
synclient TouchpadOff=1

#launch the input manager
ibus-daemon --xim &

#launch awesomewm
exec awesome
