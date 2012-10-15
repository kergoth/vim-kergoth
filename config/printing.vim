" Syntax
set popt+=syntax:y

" Line numbering
set popt+=number:y

" Paper size
set popt+=paper:letter

" Margins
set popt+=left:5pc

" Most printers are Latin1, inform Vim so it can convert.
set printencoding=latin1

" Color scheme to use for printing
let g:print_syntax = 'solarized'

fun! Print(...)
  let l:colo = g:colors_name
  let l:printcolo = a:0 == 1 ? a:1 : g:print_syntax
  let l:bg = &background

  exe 'colo ' . l:printcolo
  let &background = 'light'
  ha
  exe 'colo ' . l:colo
  let &background = l:bg
endfun
