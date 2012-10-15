" Set the compiler to the filetype by default
au FileType * try | exe 'compiler ' . &filetype | catch | endtry

try
  " if we have a Vim which supports QuickFixCmdPost (Vim7),
  " give us an error window after running make, grep etc, but
  " only if results are available.
  au QuickFixCmdPost * botright cwindow 5
catch
endtry

" Cscope
if has("cscope")
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif

" Tags search path
set tags=./tags,tags,./.tags,.tags

" More things we don't care about
set suffixes+=.in,.a,.lo,.o,.moc,.la,.closure

" Close out the quickfix window if it's the only open window
fun! <SID>QuickFixClose()
  if &buftype == 'quickfix'
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfun
au BufEnter * call <SID>QuickFixClose()

" Grab whatever ctags command we have
for name in ['ctags', 'exuberant-ctags', 'exctags']
  if executable(name)
    let g:easytags_cmd = name
  endif
endfor

" If we don't have ctags, silently don't load easytags
if !exists('g:easytags_cmd')
  let g:loaded_easytags = 1
endif
