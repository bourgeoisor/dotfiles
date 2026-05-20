#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
# Treat unset variables as an error.
# Prevent masking pipeline errors.
set -euo pipefail

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print banner
echo -e "${BLUE}=================================${NC}"
echo -e "${BLUE}     Dotfiles CLI Installer      ${NC}"
echo -e "${BLUE}=================================${NC}"
echo

# Backup directory
BACKUP_DIR="${HOME}/.dotfiles_backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Configurations to symlink relative to home directory (with a dot prefix)
configs=(
    "tmux.conf"
    "config/tmux/plugins/tmux-dotbar/dotbar.tmux"
    "config/starship.toml"
    "config/fish/config.fish"
    "config/ghostty/config"
)

# Get absolute path of dotfiles repository
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to link a configuration file
link_config() {
    local cfg="$1"
    local src="${DOTFILES_DIR}/${cfg}"
    local dest="${HOME}/.${cfg}"

    # Ensure source file exists
    if [ ! -e "${src}" ]; then
        echo -e "${RED}✘${NC} Source file does not exist: ${src}"
        return 1
    fi

    # Check if destination exists
    if [ -L "${dest}" ]; then
        local current_link
        current_link=$(readlink "${dest}")
        if [ "${current_link}" = "${src}" ]; then
            echo -e "${GREEN}✔${NC} ~/.${cfg} is already linked correctly."
            return 0
        fi
        # It's a symlink but points to the wrong target
        echo -e "${YELLOW}⚠${NC} ~/.${cfg} is a symlink pointing to ${current_link}. Backing it up..."
    elif [ -e "${dest}" ]; then
        # It's a regular file or directory
        echo -e "${YELLOW}⚠${NC} ~/.${cfg} already exists as a file/directory. Backing it up..."
    fi

    # Perform backup if destination exists
    if [ -e "${dest}" ] || [ -L "${dest}" ]; then
        mkdir -p "${BACKUP_DIR}/$(dirname "${cfg}")"
        mv "${dest}" "${BACKUP_DIR}/${cfg}.${TIMESTAMP}"
        echo -e "${YELLOW}  Moved old configuration to ${BACKUP_DIR}/${cfg}.${TIMESTAMP}${NC}"
    fi

    # Ensure target parent directory exists
    mkdir -p "$(dirname "${dest}")"

    # Link the file
    ln -sf "${src}" "${dest}"
    echo -e "${GREEN}✔${NC} Successfully linked ~/.${cfg}"
}

# Iterate through configs
for cfg in "${configs[@]}"; do
    link_config "${cfg}"
done

echo
echo -e "${GREEN}★ All configurations processed successfully! ★${NC}"
if [ -d "${BACKUP_DIR}" ]; then
    echo -e "${BLUE}ℹ${NC} Backups of replaced configs (if any) are stored in ${BACKUP_DIR}/"
fi
