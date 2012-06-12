#!/bin/bash

function check_link {
    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

# Remove unwanted files
rm -rf $HOME/.vim
rm $HOME/.vimrc
rm $HOME/.gvimrc
rm $HOME/.zshrc

# Create symbolic links
check_link "dotfiles/vim/vimrc"  ".vimrc"
check_link "dotfiles/vim/gvimrc"  ".gvimrc"
check_link "dotfiles/vim"  ".vim"
check_link "dotfiles/zsh/zshrc"  ".zshrc"

# Initialize vim git submodules
git submodule update --init

# Install oh-my-zsh
cd $HOME
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
