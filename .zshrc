export PATH="$HOME/bin:$PATH"

# Setup oh-my-zsh
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

