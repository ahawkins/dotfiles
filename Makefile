DEST    ?= $$HOME
BIN_DIR := /usr/local/bin

.PHONY: install
install:
	stow -t $(DEST) fish-stow
	stow -t $(DEST) tmux-stow
	stow -t $(DEST) git-stow
	stow -t $(DEST) vim-stow
	stow -t $(DEST) gnupg

.PHONY: install-bin
install-bin:
	stow -t /usr/local/bin bin
