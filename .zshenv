. "$HOME/.cargo/env"

# nvim
function nvimvenv {
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

alias txq="tmuxinator stop"
alias u="/Users/vkushwaha/.scripts/update.sh"
alias v=$VISUAL
alias dbs="tmuxinator start db"
alias dbq="tmuxinator stop db"
alias cfg='/usr/bin/git --git-dir=/Users/vkushwaha/.cfg/ --work-tree=/Users/vkushwaha'
alias config='/opt/homebrew/bin/lazygit --git-dir=/Users/vkushwaha/.cfg/ --work-tree=/Users/vkushwaha'
