DEST ?= $$HOME

.PHONY: install
install:
	stow -v -n -t $(DEST) fish-stow
