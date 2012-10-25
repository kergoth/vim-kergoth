" Apply user configuration
runtime! config/*.vim

" Load a site specific vimrc if one exists (useful for things like font sizes)
if exists('$HOSTNAME')
  try
    source ~/.vimrc.$HOSTNAME
  catch
  endtry
endif
