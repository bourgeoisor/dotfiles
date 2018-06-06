# My Dotfiles

This repository contains the entirety of my Linux configuration. It is mainly intended for my own personal usage,
but feel free to use part or all of the files!

Usage
-----

Firstly, clone the repository.

    git clone git://github.com/finiks/dotfiles.git
    
Then, change your working directory into the cloned repository.

    cd dotfiles
    
Finally, run the install script.

    ./install.sh

**Warning:** this process will overwrite any existing configuration files and possibly install unwanted applications.
If your goal is to only install some configuration files, it would be wiser to manually link them to your home directory.

For instance, to only install the compton configuration file, one could run the following.

    ln -s compton.conf ~/.compton.conf

My Setup
--------

- iTerm2
- Homebrew
- IntelliJ
- Postman
- Evernote
- VSCode

- htop
- vim
- tree
- tmux
- fish
