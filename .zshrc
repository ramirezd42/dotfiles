# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Setup vi style bindings for shell
set -o vi

# Load aliases
source ~/.zsh_aliases
if [ -f "$HOME/.zsh_aliases_local" ]; then
  source $HOME/.zsh_aliases_local
fi

# Load local zshrc file if found
if [ -f "$HOME/.zshrc_local" ]; then
  source $HOME/.zshrc_local
fi

