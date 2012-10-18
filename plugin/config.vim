" Apply user configuration
runtime! config/*.vim

" Load a site specific vimrc if one exists (useful for things like font sizes)
if exists('$HOSTNAME')
  source ~/.vimrc.$HOSTNAME
endif
