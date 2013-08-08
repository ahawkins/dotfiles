# vim:ft=conf:

set -g prefix C-a

unbind C-b

set-window-option -g automatic-rename off

# This fixs escape in vim insert mode
set -sg escape-time 50

set -g base-index 1

setw -g pane-base-index 1

bind r source-file ~/.tmux.conf \; display "Reloaded!"

bind | split-window -h
bind \ split-window -h # Because shift is hard
bind - split-window -v

# smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"

# bring back C-l
bind C-l send-keys 'C-l'


# Resize panes with vim like things
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# Use the mouse, this isn't 1968
setw -g mode-mouse on
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on

# Use 256color screen. This makes vim look pretty
set -g default-terminal "screen-256color"

setw -g monitor-activity on
set -g visual-activity on

# set the status line's colors
set -g status-bg colour233

# set the color of the window list
setw -g window-status-fg colour238

# set colors for the active window
setw -g window-status-current-fg colour250
setw -g window-status-current-bg colour021
setw -g window-status-current-format "[ #I:#W#F ]"

# pane colors
set -g pane-border-fg colour238
set -g pane-border-bg colour238
set -g pane-active-border-fg colour255
set -g pane-active-border-bg colour021

# Status line left side
# user | session | window.pane
set -g status-left-length 40 
set -g status-left "#[fg=colour000, bg=colour253] #(whoami) @ #h #[fg=colour000, bg=colour244] #S #[fg=colour000, bg=colour238] #I.#P "


set -g status-utf8 on

# Status line right side
# now playing in iTunes | battery % | 28 Nov 18:15
set -g status-right-length 90
set -g status-right "#[fg=colour000, bg=colour238] #(~/dotfiles/scripts/np_itunes_mac.sh) #[fg=colour000, bg=colour244] #(~/dotfiles/scripts/battery_mac.sh) #[fg=colour000, bg=colour253] %d %b %R "

# Update the status bar every 2 seconds
set -g status-interval 2

set -g status-justify centre

# enable vi keys.
setw -g mode-keys vi

# Copy paste stuff
# http://robots.thoughtbot.com/post/55885045171/tmux-copy-paste-on-os-x-a-better-future
# Setup 'v' to begin selection as in Vim
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

# Update default binding of `Enter` to also use copy-pipe
unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
