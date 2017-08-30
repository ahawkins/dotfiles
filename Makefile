DEST    ?= $$HOME

REAL_DIRS := \
	.config/env\
	.config/fish/completions \
	.config/fish/conf.d \
	.config/fish/functions \
	.gnupg \
	.ssh \
	.vim/backups \
	.vim/bundle

FORCE_DIRS:=$(addprefix $(DEST)/,$(REAL_DIRS))


$(FORCE_DIRS):
	mkdir -p $@

.PHONY: install
install: | $(FORCE_DIRS)
	stow -t $(DEST) fish
	stow -t $(DEST) tmux
	stow -t $(DEST) git
	stow -t $(DEST) vim
	stow -t $(DEST) gnupg
	stow -t $(DEST) bin
	stow -t $(DEST) ag
	stow -t $(DEST) ledger
