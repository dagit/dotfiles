#!/bin/bash

IGNORED=(. .. .git .gitignore)
DOTFILES=(.*)

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
