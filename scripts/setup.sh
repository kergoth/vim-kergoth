#!/bin/sh -e

scriptsdir=$(cd $(dirname $0) && pwd)

mkdir -p ~/.vim/{bundle,backup,undo,swap}

if ! [ -d ~/.vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

if ! [ -d ~/.vim/bundle/vim-kergoth ]; then
    git clone https://github.com/kergoth/vim-kergoth ~/.vim/bundle/vim-kergoth
fi

test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.bak
ln -sf $(dirname $scriptsdir)/vimrc ~/.vimrc

vim +BundleInstall +qall </dev/tty
