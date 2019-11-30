#bin/sh

# install homebrew
if ! [ -x "$(command -v brew)" ]; then
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

add_brew () {
  echo 'hello, world'
}

./setup_symlinks.sh
