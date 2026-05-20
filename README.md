![GitHub License](https://img.shields.io/github/license/bourgeoisor/dotfiles)

# My Dotfiles

These are my personal dotfiles, customized for a modern development environment on macOS and Unix systems using Fish, Ghostty, and Tmux. Feel free to use them or borrow bits and pieces for your own setup!

## Installation

To install, clone this repository and run the setup script:

```bash
git clone https://github.com/bourgeoisor/dotfiles
cd dotfiles
./install.sh
```

_**Note:** Running the installation script will symlink these configuration files into your home directory (e.g., `~/.tmux.conf`). If you have existing files there, the script will back them up to `~/.dotfiles_backup/` before linking, but it's always a good idea to back up important files beforehand._

## Repository structure

*   `install.sh`: The installer script that creates symbolic links in your home directory.
*   `config/`: Configuration directories for active applications:
*   `legacy/`: Historical configurations for my old Linux/X11 setups (e.g., AwesomeWM, BSPWM, Compton, Irssi, Ncmpcpp, Zsh, etc.).
