#!/bin/bash

MODE=$(/opt/homebrew/bin/dark-notify -e)

TMUX_CONFIG_PATH="/Users/vkushwaha/.config/tmux/tmux.conf"

if [[ $MODE == "dark" ]]; then
  sed -i "" "s/latte/mocha/g" "$TMUX_CONFIG_PATH"
else
  sed -i "" "s/mocha/latte/g" "$TMUX_CONFIG_PATH"
fi

# reload tmux
# /opt/homebrew/bin/tmux source "/Users/vkushwaha/.config/tmux/reset.tmux"
/opt/homebrew/bin/tmux source $TMUX_CONFIG_PATH
