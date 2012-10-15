" Apply user configuration
for cfg in split(globpath(&runtimepath, 'config/*.vim'))
  exe 'source ' . cfg
endfor

" Load a site specific vimrc if one exists (useful for things like font sizes)
if exists('$HOSTNAME')
  source ~/.vimrc.$HOSTNAME
endif
