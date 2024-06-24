#!/bin/bash

MODE=$(/opt/homebrew/bin/dark-notify -e)

ALACRITTY_CONFIG_PATH="/Users/vkushwaha/.config/alacritty/alacritty.toml"
TMUX_CONFIG_PATH="/Users/vkushwaha/.config/tmux/tmux.conf"
LAZYGIT_CONFIG_PATH="/Users/vkushwaha/.config/lazygit/config.yml"

if [[ $MODE == "dark" ]]; then
	sed -i "" "s/_latte/_mocha/g" "$ALACRITTY_CONFIG_PATH"
	sed -i "" "s/latte/mocha/g" "$TMUX_CONFIG_PATH"
	ln -sf "$LAZYGIT_CONFIG_PATH/../themes/lazygit/themes/mocha/rosewater.yml" "$LAZYGIT_CONFIG_PATH"
else
	sed -i "" "s/_mocha/_latte/g" "$ALACRITTY_CONFIG_PATH"
	sed -i "" "s/mocha/latte/g" "$TMUX_CONFIG_PATH"
	ln -sf "$LAZYGIT_CONFIG_PATH/../themes/lazygit/themes/latte/rosewater.yml" "$LAZYGIT_CONFIG_PATH"
fi

# reload tmux
/opt/homebrew/bin/tmux source $TMUX_CONFIG_PATH
