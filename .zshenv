# nvim
function nvimvenv {
  nvm --version > /dev/null
  if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
    source "$VIRTUAL_ENV/bin/activate"
    command nvim "$@"
    deactivate
  else
    command nvim "$@"
  fi
}

alias nvim=nvimvenv
export VISUAL="nvim"
export EDITOR=$VISUAL

export XDG_CONFIG_HOME=$HOME/.config
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export HOMEBREW_AUTO_UPDATE_SECS=86400

alias cfg='/usr/bin/git --git-dir=/Users/vkushwaha/.cfg/ --work-tree=/Users/vkushwaha'
alias config='/opt/homebrew/bin/lazygit --git-dir=/Users/vkushwaha/.cfg/ --work-tree=/Users/vkushwaha'
alias gg="/opt/homebrew/bin/lazygit"
alias tg="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"
alias txq="tmuxinator stop"
alias u="/Users/vkushwaha/.scripts/update.sh"
alias v=$VISUAL
