export PATH="$HOME/bin:$PATH:$HOME/git/dotfiles/bin"
export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"
export licenseKey=3F11EBA6-F68643CE-9D89E795-C3C8519C

# Setup oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="refined"
plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

# Load aliases
source ~/.zsh_aliases
if [ -f "$HOME/.zsh_aliases_local" ]; then
  source $HOME/.zsh_aliases_local
fi

# Load local zshrc file if found
if [ -f "$HOME/.zshrc_local" ]; then
  source $HOME/.zshrc_local
fi

# I dont want to run husky
export HUSKY_SKIP_HOOKS=0

# Use nvim for git
git config --global core.editor "nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
