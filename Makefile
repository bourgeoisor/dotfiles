all: link

link: config irssi ncmpcpp vim zsh conkyrc muttrc vimrc Xdefaults xinitrc zshrc
	$(foreach file, $^, rm -Rf ~/.$(file); )
	$(foreach file, $^, ln -s $(CURDIR)/$(file) ~/.$(file); )

