" Indent by shiftwidth at beginning of line rather than ts/sts
set smarttab

" Disable insertion of tabs as compression / indentation
set expandtab

" How many spaces a hard tab in the file is shown as, and how many
" spaces are replaced with one hard tab when using sts != ts and noet.
set tabstop=8

" Indentation width (affects indentation plugins, indent based
" folding, etc, and when smarttab is on, is used instead of ts/sts
" for the indentation at beginning of line.
set shiftwidth=4

" Number of spaces that the tab key counts for when editing
" Only really useful if different from ts, or if using et.
" When 0, it is disabled.
set softtabstop=4

" Round indent to a multiple of 'shiftwidth'
set shiftround


set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,l0,g0,hs,ps,ts,+s,c3,C0,(0,us,\U0,w0,m0,j0,)20,*30
set cinkeys=0{,0},0),:,0#,!^F,o,O,e

set autoindent
set copyindent
set preserveindent
set nosmartindent

" If detectindent is available, use it to determine the appropriate
" indentation settings for the current file
augroup KergothIndentation
  au!
  au BufReadPost * if exists("loaded_detectindent") | exe "DetectIndent" | endif
augroup END
