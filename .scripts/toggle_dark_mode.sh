#!/bin/bash

MODE=$(/opt/homebrew/bin/dark-notify -e)

TMUX_CONFIG_PATH="/Users/vkushwaha/.config/tmux/tmux.conf"
K9S_CONFIG_PATH="/Users/vkushwaha/.config/k9s/config.yaml"

if [[ $MODE == "dark" ]]; then
  sed -i "" "s/latte/mocha/g" "$TMUX_CONFIG_PATH"
  sed -i "" "s/latte/mocha/g" "$K9S_CONFIG_PATH"
else
  sed -i "" "s/mocha/latte/g" "$TMUX_CONFIG_PATH"
  sed -i "" "s/mocha/latte/g" "$K9S_CONFIG_PATH"
fi

# reload tmux
# /opt/homebrew/bin/tmux source "/Users/vkushwaha/.config/tmux/reset.tmux"
/opt/homebrew/bin/tmux source $TMUX_CONFIG_PATH
