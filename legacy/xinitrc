#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Rehash the fonts
xset +fp ~/.fonts/
xset +fp /etc/fonts/local/
xset fp rehash
setxkbmap -option grp:caps_toggle us,ca

# Cursor
xsetroot -cursor_name left_ptr &

# Background
feh --bg-tile /home/finiks/.config/wallpaper

# Compton
compton &

# Dunst
dunst &

# Launch mpd
mpd &
mpdas -c ~/.mpdasrc &

# Disable the touchpad
synclient TouchpadOff=1

# Puts numlock on
numlockx &

# Launch the input manager
ibus-daemon --xim &

# Launch lemonbar
bar | lemonbar -g 1900x20+10+10 -B "#FF181818" -F "#FFBCBCAF" -f "-*-terminus-medium-r-normal-*-12-*-*-*-c-*-*-1" &

# Launch redshift
redshift -l 46.220197:-64.534687 &

# Launch bspwm
sxhkd &
exec bspwm
