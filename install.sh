#!/bin/bash

PWD=`pwd`
for file in `ls -a ./dotfiles/`;
do
  if [ "$file" != "." ] && [ "$file" != ".." ]; then
    fileloc="$PWD/dotfiles/$file"
    cmd="ln -sfF $fileloc $HOME/."
    echo $cmd
    $cmd
  fi
done
echo $(dirname "$0")

ln -sf "$PWD/settings/vscode/settings.json" "$HOME/Library/Application Support/Code/User/"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

