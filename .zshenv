. "$HOME/.cargo/env"

# lvim
export PATH=$HOME/.local/bin:$PATH
function lvimvenv {
  nvm --version > /dev/null
  if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
    source "$VIRTUAL_ENV/bin/activate"
    command lvim "$@"
    deactivate
  else
    command lvim "$@"
  fi
}
alias lvim=lvimvenv
export VISUAL="lvim"
export EDITOR=$VISUAL

export XDG_CONFIG_HOME=$HOME/.config
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

alias txq="tmuxinator stop"
alias u="/Users/vkushwaha/.scripts/update.sh"
alias nsd="~/Documents/netskope/projects/"
alias dbs="tmuxinator start db"
alias dbq="tmuxinator stop db"
alias cfg='/usr/bin/git --git-dir=/Users/vkushwaha/.cfg/ --work-tree=/Users/vkushwaha'
