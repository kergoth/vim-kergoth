" Backspace over anything
set backspace=indent,eol,start

" Allow virtual editing in visual block mode
set virtualedit+=block

" Don't insert two spaces after a '.' with the join command
set nojoinspaces

" Disable entering of digraphs in Insert mode
set nodigraph

" Many levels of undo
set undolevels=500

" Avoid storing persistent undo information for temporary files
if has('persistent_undo')
  au BufReadPre .netrwhist set noundofile
  au BufReadPre $TEMP/* set noundofile
  au BufReadPre .git/COMMIT_EDITMSG set noundofile
endif

" Longer commandline and search history
if has('cmdline_hist')
  set history=500
endif

" Allow editing of all types of files
if has('unix')
  set fileformats=unix,dos,mac
elseif has('mac')
  set fileformats=mac,unix,dos
else
  set fileformats=dos,unix,mac
endif

" Viminfo file behavior
if has('viminfo')
  " f1  store file marks
  " '   # of previously edited files to remember marks for
  " :   # of lines of command history
  " /   # of lines of search pattern history
  " <   max # of lines for each register to be saved
  " s   max # of Kb for each register to be saved
  " h   don't restore hlsearch behavior
  let &viminfo = "f1,'1000,:1000,/1000,<1000,s100,h,r" . $TEMP
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
function! <SID>RestorePosition()
  if &ft == 'gitcommit'
    return
  endif

  if line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endfunction

autocmd BufReadPost * call <SID>RestorePosition()

" Only save the current tab page
set sessionoptions-=tabpages

" Don't save help windows
set sessionoptions-=help

" Default to replace all in :s
set gdefault

" When selecting with the mouse, copy to clipboard on release.
vnoremap <LeftRelease> '+y<LeftRelease>gv
vnoremap <RightRelease> '+y<RightRelease>gv

" Termencoding will reflect the current system locale, but internally,
" we use utf-8, and for files, we use whichever encoding from
" &fileencodings was detected for the file in question.
let &termencoding = &encoding
if has('multi_byte')
  set encoding=utf-8

  " fileencoding value is used for new files
  let &fileencoding = &encoding
  set fileencodings=ucs-bom,utf-8,default,latin1
endif

" Reload file with the correct encoding if fenc was set in the modeline
au BufReadPost * let b:reloadcheck = 1
au BufWinEnter *
      \ if exists('b:reloadcheck') |
      \   if &mod != 0 && &fenc != '' |
      \     exe 'e! ++enc=' . &fenc |
      \   endif |
      \   unlet b:reloadcheck |
      \ endif

" Make operations like yank, which normally use the unnamed register, use the
" * register instead (yanks go to the system clipboard).
set clipboard=autoselect,unnamed
if has('gui_running') && has('unix')
  set clipboard+=exclude:cons\|linux
end

" Ignore binary files matched with grep by default
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%-OBinary\ file%.%#

" Use ack if available
if executable('ack')
  set grepprg=ack\ -H\ --nocolor\ --nogroup\ --column\ $*\ /dev/null
  set grepformat=%f:%l:%c:%m
elseif executable('ack-grep')
  set grepprg=ack-grep\ -H\ --nocolor\ --nogroup\ --column\ $*\ /dev/null
  set grepformat=%f:%l:%c:%m
endif

" Prompt for confirmation where appropriate, rather than failing
set confirm

" Use 'par' for formatting if available
if executable('par')
  let &formatprg = 'par ' . &textwidth . 're'
endif

" Reliant upon securemodelines rather than the built in one
set nomodeline
set modelines=5

" Configure securemodelines the way we like it
let g:secure_modelines_verbose = 1
let g:secure_modelines_allowed_items = [
            \ "textwidth",    "tw",
            \ "softtabstop",  "sts",
            \ "tabstop",      "ts",
            \ "shiftwidth",   "sw",
            \ "expandtab",    "et",   "noexpandtab", "noet",
            \ "filetype",     "ft",
            \ "fileencoding", "fenc",
            \ "foldmethod",   "fdm",
            \ "foldlevel",    "fdl",
            \ "readonly",     "ro",   "noreadonly", "noro",
            \ "rightleft",    "rl",   "norightleft", "norl",
            \ "wrap", "nowrap",
            \ ]


" When using the fugitive plugin, don't let its old buffers stick around
autocmd BufReadPost fugitive://* set bufhidden=delete
