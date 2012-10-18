# My VIM setup

## Installation

NOTE: This will move your existing .vimrc to .vimrc.bak and create a new .vimrc

    curl -s https://raw.github.com/kergoth/vim-kergoth/master/scripts/setup.sh | sh

If you wish to use the command-t plugin, you will then need to:

    cd ~/.vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make

Then restart vim and you'll be good to go.

## TODO

- Bring over the detailed information from the README from my old vim setup
- Add the snipmate bundle
