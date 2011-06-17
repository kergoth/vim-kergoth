set laststatus=2
if has('statusline')
  set statusline=
  set statusline+=%-3.3n\                      " buffer number
  set statusline+=%(%{StatusLine_FileName()}\ %) " filename
  set statusline+=%h%m%r%w                     " status flags
  set statusline+=%{StatusLine_Pasting()}      " 'paste' option state
  set statusline+=%{StatusLine_GitBranch()}    " current git branch
  set statusline+=%((%{StatusLine_Tlist_Info()})\ %) " tag name

  set statusline+=%(\[%{&ft}]%)               " file type
  set statusline+=%=                          " right align remainder
  set statusline+=%-14(%l,%c%V%)              " line, character
  set statusline+=%<%P                        " file position
endif

if has('autocmd') && v:version >= 700
  " Special statusbar for special windows
  " NOTE: only Vim7+ supports a statusline local to a window
  augroup KergothStatusLines
    au!
    au VimEnter,BufWinEnter __Tag_List__
          \ setlocal statusline=\[Tags\] |
          \ setlocal statusline+=%= |
          \ setlocal statusline+=%l
  augroup END
endif

fun! StatusLine_Tlist_Info()
  if exists('g:loaded_taglist') &&
        \ g:loaded_taglist == 'available'
    return Tlist_Get_Tagname_By_Line()
  else
    return ''
  endif
endfun

fun! StatusLine_FileName()
  try
    let fn = pathshorten(expand('%f')) . ' '
  catch
    let fn = expand('%f') . ' '
  endtry
  return fn
endfun

fun! StatusLine_GitBranch()
  if exists('g:loaded_fugitive')
    return fugitive#statusline()
  else
    return ''
  endif
endfun

fun! StatusLine_Pasting()
  if &paste
    return '[paste]'
  else
    return ''
  endif
endfun
