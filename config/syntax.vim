if has('syntax')
  syntax enable
endif

augroup KergothHighlight
  au!
  " Conceal fold markers if the feature is available
  if has('conceal')
    au BufRead,BufNewFile *
          \ syn match foldMarker contains= contained conceal /{{{[1-9]\?\|}}}[1-9]\?/
  else
    au BufRead,BufNewFile *
          \ syn match foldMarker contains= contained /{{{[1-9]\?\|}}}[1-9]\?/
  endif

  " Highlight vim modelines
  au BufRead,BufNewFile * syn match vimModeline contains=@NoSpell contained /vim:\s*set[^:]\{-1,\}:/

  " Highlight the textwidth column in insert mode
  if exists('&colorcolumn')
    au InsertEnter * set colorcolumn=+1
    au InsertLeave * set colorcolumn=
  endif
augroup END

" Colors red both trailing whitespace:
"  foo   
"  bar	
" And spaces before tabs:
" foo 	bar
hi def link RedundantWhitespace Error
match RedundantWhitespace /\s\+$\| \+\ze\t/

" Highlighting of Vim modelines, and hiding of fold markers
hi def link vimModeline Special
hi def link foldMarker NonText

" The default coloring of concealed items is terrible
hi! def link Conceal SpecialKey
