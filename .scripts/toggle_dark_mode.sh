#!/bin/bash

MODE=`/opt/homebrew/bin/dark-notify -e`

ALACRITTY_CONFIG_PATH="/Users/vkushwaha/.config/alacritty/alacritty.toml"
LUNARVIM_CONFIG_PATH="/Users/vkushwaha/.config/lvim/config.lua"
TMUX_CONFIG_PATH="/Users/vkushwaha/.config/tmux/tmux.conf"
# LAZYGIT_CONFIG_PATH="/Users/vkushwaha/.config/lazygit/config.yml"

if [[ $MODE == "dark" ]]
then
    sed -i "" "s/light/dark/g" "$ALACRITTY_CONFIG_PATH"
    sed -i "" "s/ = \"light\"/ = \"dark\"/g" "$LUNARVIM_CONFIG_PATH"
    sed -i "" "s/light/dark/g" "$TMUX_CONFIG_PATH"
    # sed -i "" "s/black/white/g" "$LAZYGIT_CONFIG_PATH"
else
    sed -i "" "s/dark/light/g" "$ALACRITTY_CONFIG_PATH"
    sed -i "" "s/ = \"dark\"/ = \"light\"/g" "$LUNARVIM_CONFIG_PATH"
    sed -i "" "s/dark/light/g" "$TMUX_CONFIG_PATH"
    # sed -i "" "s/white/black/g" "$LAZYGIT_CONFIG_PATH"
fi

# reload tmux
/opt/homebrew/bin/tmux source $TMUX_CONFIG_PATH

# reload lunarvim
pgrep lvim
for pid in $(pgrep lvim);
do
    kill -SIGUSR1 $pid
done
