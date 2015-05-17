all: link

link: config compton.conf irssi mpdconf ncmpcpp vim zsh conkyrc vimrc rtorrent.rc Xdefaults xinitrc zshrc
	$(foreach file, $^, rm -Rf ~/.$(file) && ln -sf $(CURDIR)/$(file) ~/.$(file);)

