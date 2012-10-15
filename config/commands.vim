" Change the current directory to the location of the
" file being edited.
command! -nargs=0 -complete=command   Bcd lcd %:p:h

" Make :Man available
runtime ftplugin/man.vim

" Quieter grep
command! -nargs=+ Grep execute 'silent grep! <args>' | redraw!

" Highlight tags with easytags only using the local tags file
command! -nargs=0 LocalTags let g:easytags_file = './.tags' | HighlightTags

" Write a file with sudo
command! -bar -nargs=0 SudoWrite
      \ | :silent exe "write !sudo tee % >/dev/null" | silent edit!
