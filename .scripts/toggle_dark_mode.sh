#!/bin/bash

MODE=$(/opt/homebrew/bin/dark-notify -e)

ALACRITTY_CONFIG_PATH="/Users/vkushwaha/.config/alacritty/alacritty.toml"
TMUX_CONFIG_PATH="/Users/vkushwaha/.config/tmux/tmux.conf"
LAZYGIT_CONFIG_PATH="/Users/vkushwaha/.config/lazygit/config.yml"
LAZYNVIM_PATH="/Users/vkushwaha/.local/share/nvim/lazy"

if [[ $MODE == "dark" ]]; then
	sed -i "" "s/_day/_night/g" "$ALACRITTY_CONFIG_PATH"
	sed -i "" "s/day/night/g" "$TMUX_CONFIG_PATH"
	ln -sf "$LAZYNVIM_PATH/tokyonight.nvim/extras/lazygit/tokyonight_night.yml" "$LAZYGIT_CONFIG_PATH"
else
	sed -i "" "s/_night/_day/g" "$ALACRITTY_CONFIG_PATH"
	sed -i "" "s/night/day/g" "$TMUX_CONFIG_PATH"
	ln -sf "$LAZYNVIM_PATH/tokyonight.nvim/extras/lazygit/tokyonight_day.yml" "$LAZYGIT_CONFIG_PATH"
fi

# reload tmux
/opt/homebrew/bin/tmux source $TMUX_CONFIG_PATH

# reload lunarvim
pgrep lvim
for pid in $(pgrep lvim); do
	kill -SIGUSR1 $pid
done
