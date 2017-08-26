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

$(addprefix $(DESTDIR)/,$(REAL_DIRS)):
	mkdir -p $@

.PHONY: install
install: | $(REAL_DIRS)
	stow -t $(DEST) fish
	stow -t $(DEST) tmux
	stow -t $(DEST) git
	stow -t $(DEST) vim
	stow -t $(DEST) gnupg
