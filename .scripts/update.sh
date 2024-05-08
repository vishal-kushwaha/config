echo "\n==> Updating brew formulae and casks"
brew update
brew upgrade
brew upgrade --cask

echo "\n==> Cleaning up brew leftovers"
brew autoremove
brew cleanup

echo "\n==> Updating Lunarvim"
~/.local/bin/lvim --headless +LvimUpdate +"lua require('lazy').update({wait=true})" +qa

echo "\n\n==> Reloading lvim instances"
for pid in $(pgrep lvim);
do
  kill -s USR1 $pid
done
