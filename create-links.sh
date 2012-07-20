#!/bin/bash

IGNORED=(. .. .git .gitignore .ssh)
DOTFILES=(.* .ssh/rc)

function containsElement () {

  for e in "${@:2}"
  do
    [[ "$e" == "$1" ]] && echo 1 && return
  done

  echo 0
}

for f in "${DOTFILES[@]}"
do
  symlink=$HOME/$f
  target=$PWD/$f
  if [[ $(containsElement "$f" "${IGNORED[@]}") == 0 ]]
  then
    if [[ -L $symlink ]]
    then
      echo "Ignoring $symlink: exists and is a symlink."
    elif [[ -e $symlink && ! -L $symlink ]]
    then
      echo "Ignoring $symlink: exists, but is not a symlink. Remove and rerun?"
    elif [[ ! -e $symlink ]]
    then
      echo "Creating: $symlink -> $target"
      ln -s $target $symlink
    fi
  fi
done

# Also install Vundle if it's not already present:
VUNDLE_DIR=~/.vim/bundle/vundle
VUNDLE_REPO=https://github.com/gmarik/vundle.git
if [[ ! -e "$VUNDLE_DIR" ]]
then
  git clone "$VUNDLE_REPO" "$VUNDLE_DIR"
fi

# Update Vundle
#vim +BundleInstall\! +qall
vim +BundleInstall +qall
