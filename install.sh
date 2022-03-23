#!/bin/bash

set -e

OLDPWD=`pwd`

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install aws-vault zsh plugin
mkdir -p ~/.oh-my-zsh/custom/plugins
git clone git@github.com:blimmer/zsh-aws-vault.git ~/.oh-my-zsh/custom/plugins/zsh-aws-vault

cd $OLDPWD

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

ln -sf "$PWD/settings/vscode/settings.json" "$HOME/Library/Application Support/Code/User/"
