#!/bin/sh

dir=~/dotfiles
files="*"

cd $dir

for file in $files; do
    rm -Rf ~/.$file
    ln -s $dir/$file ~/.$file
done
