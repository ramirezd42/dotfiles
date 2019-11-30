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
    echo "❌ Error: package not installed"	
    exit 1
  fi
}

echo "\nInstalling homebrew packages..."
add_package 'zsh'
add_package 'tig'
add_package 'jq'
add_package 'neovim'
add_package 'tmux'
add_package 'the_silver_searcher'

echo "\n"


# Install oh-my-zsh
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  echo "✅ Found oh-my-zsh."
else
  echo "\noh-my-zsh not found. Installing..."
  chsh -s /bin/sh || \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || \
    exit 1
fi

# Setup symlinks for the dotfiles
./setup_symlinks.sh || exit 1

echo "👍 Have fun. Be safe!"
