echo "\n==> Updating brew formulae and casks"
brew update
brew upgrade
brew upgrade --cask

echo "\n==> Cleaning up brew leftovers"
brew autoremove
brew cleanup

echo "\n==> Updating neovim"
nvim --headless "+Lazy! sync" +qa
