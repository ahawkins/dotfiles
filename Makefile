.DEFAULT_GOAL:= install

DEST    ?= $$HOME

REAL_DIRS := \
	.local \
	.config/env\
	.config/fish/completions \
	.config/fish/conf.d \
	.config/fish/functions \
	.config/direnv \
	.gnupg \
	.ssh \
	.vim/backups \
	.vim/bundle

FORCE_DIRS:=$(addprefix $(DEST)/,$(REAL_DIRS))
COLORS:=\
	themes/iterm2/skylines-dark.json \
	themes/.vim/colors/skylinesdark.vim \
	themes/.config/tmux/skylines-dark.conf

$(FORCE_DIRS):
	mkdir -p $@

themes/iterm2/%.json: colors/%.yml
	mkdir -p $(@D)
	colors/template -n $* -d $< -t colors/templates/iterm2_profile.mustache | jq . > $@

themes/.vim/colors/%.vim: colors/templates/vim/%.mustache
	mkdir -p $(@D)
	colors/template -n $*  -t $< -d colors/$*.yml > $@

themes/.config/tmux/%.conf: colors/templates/tmux/%.mustache
	mkdir -p $(@D)
	colors/template -n $*  -t $< -d colors/$*.yml > $@

# Fix VIM's weirdness with files ending in -.vim
themes/.vim/colors/skylinesdark.vim: themes/.vim/colors/skylines-dark.vim
	mv $< $@

.PNONY: colors
colors: $(COLORS)

.PHONY: install
install: $(COLORS) install-iterm2 | $(FORCE_DIRS)
	stow -t $(DEST) fish
	stow -t $(DEST) tmux
	stow -t $(DEST) git
	stow -t $(DEST) vim
	stow -t $(DEST) gnupg
	stow -t $(DEST) bin
	stow -t $(DEST) ag
	stow -t $(DEST) editorconfig
	stow -t $(DEST) ssh
	stow -t $(DEST) gem
	stow -t $(DEST) asdf
	stow -t $(DEST) direnv
	stow -t $(DEST) themes

.PHONY: install-iterm2
install-iterm2: $(COLORS)
	cp -f themes/iterm2/* ~/Library/Application\ Support/iTerm2/DynamicProfiles
