all: link

link: config compton.conf irssi mpd mpdconf ncmpcpp vim zsh conkyrc muttrc vimrc rtorrent.rc Xdefaults xinitrc zshrc
	$(foreach file, $^, rm -Rf ~/.$(file) && ln -sf $(CURDIR)/$(file) ~/.$(file);)

