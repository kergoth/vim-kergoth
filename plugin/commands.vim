" Change the current directory to the location of the
" file being edited.
com! -nargs=0 -complete=command   Bcd lcd %:p:h

" Quieter grep
command! -nargs=+ Grep execute 'silent grep! <args>' | redraw!

" Highlight tags with easytags only using the local tags file
command! -nargs=0 LocalTags let g:easytags_file = './.tags' | HighlightTags

" Write a file with sudo
com! -bar -nargs=0 SudoWrite
      \ | :silent exe "write !sudo tee % >/dev/null" | silent edit!
