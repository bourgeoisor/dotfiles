all: link

link: config irssi mpd mpdconf ncmpcpp vim zsh conkyrc muttrc vimrc Xdefaults xinitrc zshrc
	$(foreach file, $^, rm -Rf ~/.$(file) && ln -sf $(CURDIR)/$(file) ~/.$(file);)

