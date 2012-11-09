#!/bin/bash

files="zlogin zlogout zpreztorc zprofile zshenv zshrc" # list of files/folders to symlink in homedir

echo "Creating symlinks..."

for file in $files; do
  echo "$file"
  ln -s ~/.zprezto/runcoms/$file ~/.$file
done

chsh -s /bin/zsh
