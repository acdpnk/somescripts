#!/bin/zsh

while (( $# != 0 )) {
  tmux splitw "ssh $1"
  tmux select-layout tiled
  shift
}

tmux set-window-option synchronize-panes on