#bin/sh

# install homebrew
echo "Installing homebrew..."
if [ -x "$(command -v brew)" ]; then
  echo "Found homebrew. skipping install.\n"
else 
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "\n"
fi

if ! [ -x "$(command -v brew)" ]; then
  echo "Error: homebrew not installed."
  exit 1
fi

# Install minpac
if [ -d "$HOME/.vim/pack/minpac/opt" ]; then
  echo "✅ Found minpac.\n"
else
  echo "\nminpac not found. Installing..."
  mkdir -p ~/.vim/pack/minpac/opt
  cd ~/.vim/pack/minpac/opt
  git clone https://github.com/k-takata/minpac.git
fi

# Install nvm
if ! [ -x "$(command -v nvm)" ]; then
  echo "✅ Found nvm.\n"
else
  echo "\nnvm not found. Installing..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi

# install homebrew packages
add_package () {
  if brew ls --versions $1 > /dev/null; then
    echo "✅ Found package $1. skipping install."	
    return
  fi
  if [ -z "$2"]; then
    brew tap $2
    echo "\n"
  fi

  brew install $1

  if ! brew ls --versions $1 > /dev/null; then
    echo "❌ Error: package $1 not installed"	
    exit 1
  fi
}

# Install oh-my-zsh
if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
  echo "✅ Found oh-my-zsh.\n"
else
  echo "\noh-my-zsh not found. Installing..."
  add_package 'zsh'
  chsh -s /bin/sh || \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || \
    exit 1
fi

echo "\nInstalling homebrew packages..."
add_package 'tig'
add_package 'jq'
add_package 'neovim'
add_package 'tmux'
add_package 'the_silver_searcher'
add_package 'reattach-to-user-namespace'
add_package 'httpie'
add_pacakge 'fzf'
$(brew --prefix)/opt/fzf/install

echo "\n"

# Setup symlinks for the dotfiles
./setup_symlinks.sh || exit 1


# echo "\nInstalling patched firacode font (dont forget to configure it in iterm as well)..."
# cd ~/Library/Fonts && { 
#    curl -O 'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete%20Mono.ttf'
#    cd -; }

echo "\n 👍 Have fun. Be safe!"
