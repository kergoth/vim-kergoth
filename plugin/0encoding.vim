" Termencoding will reflect the current system locale, but internally,
" we use utf-8, and for files, we use whichever encoding from
" &fileencodings was detected for the file in question.
let &termencoding = &encoding
if has('multi_byte')
  set encoding=utf-8
endif
