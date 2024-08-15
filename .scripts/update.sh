echo "\n==> Updating brew formulae and casks"
brew update
brew upgrade
brew upgrade --cask

echo "\n==> Cleaning up brew leftovers"
brew autoremove
brew cleanup

echo "\n==> Updating neovim"
nvim --headless "+Lazy! sync" +qa >/dev/null

echo "\n==> Updating config"
/usr/bin/git --git-dir=/Users/vkushwaha/.cfg/ --work-tree=/Users/vkushwaha pull >/dev/null
/usr/bin/git --git-dir=/Users/vkushwaha/.cfg/ --work-tree=/Users/vkushwaha submodule foreach git pull >/dev/null
