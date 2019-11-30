#bin/sh

link_file () {
  echo "$PWD/$1 -> $HOME/$2"
  if [ ! -f $HOME/$2 ] && [ ! -d $HOME/$2 ]; then
    ln -sv $PWD/$1 $HOME/$2
  else
    echo linked file/directory $HOME/$1 found. skipping...
  fi
  echo '\n'
}

link_file '.zsh_aliases' '.zsh_aliases'
link_file '.tmux-conf' '.vimrc'
link_file '.vimrc' '.vimrc'
link_file 'config' '.config'
