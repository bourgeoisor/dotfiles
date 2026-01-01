#!/bin/sh

set -x

configs=(
	tmux.conf
	config/tmux/plugins/tmux-dotbar/dotbar.tmux
	config/starship.toml
	config/fish/config.fish
	config/ghostty/config
)

for cfg in "${configs[@]}"; do
	rm -Rf "~/.${cfg}"
    mkdir -p "$(dirname "~/.${cfg}")"
    ln -sf "$(pwd)/${cfg}" "${HOME}/.${cfg}"
done
