DEST ?= $$HOME

.PHONY: install
install:
	stow -t $(DEST) fish-stow
