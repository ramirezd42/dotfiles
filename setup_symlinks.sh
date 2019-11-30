#bin/sh

link_file () {
  if [ ! -f $HOME/$2 ] && [ ! -d $HOME/$2 ]; then
    ln -sv $PWD/$1 $HOME/$2
  else
    echo existing link found for file/directory $HOME/$1...
  fi
}

echo "Setting up symlinks..."
link_file '.zsh_aliases' '.zsh_aliases'
link_file '.tmux-conf' '.vimrc'
link_file '.vimrc' '.vimrc'
link_file 'config' '.config'
