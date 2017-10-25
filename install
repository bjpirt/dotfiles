#!/bin/bash

PWD=`pwd`
for file in `ls -a ./files/`;
do
  if [ "$file" != "." ] && [ "$file" != ".." ]; then
    fileloc="$PWD/files/$file"
    cmd="ln -sfF $fileloc $HOME/."
    echo $cmd
    $cmd
  fi
done
