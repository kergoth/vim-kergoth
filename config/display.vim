" Line numbering
if v:version >= 700
  set number
endif

" Assume a fast terminal connect
set ttyfast

" No annoying beeps
set novisualbell
set noerrorbells
set vb t_vb=

" Set a sane default level for concealed items
if has('conceal')
  set conceallevel=2
endif

" Always show statusline
set laststatus=2

" Allow setting window title for screen
if &term =~ '^screen'
  set t_ts=k
  set t_fs=\
endif

" Nice window title
set title
if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%f                    " file name
  set titlestring+=%(\ %h%m%r%w%)        " flags
  set titlestring+=\ -\ %{v:progname}    " program name
endif
set titleold=

" Window resize behavior when splitting
set noequalalways
set eadirection=both

set splitright
set splitbelow

" Show normal-mode commands as you type
set showcmd

" Show cursor and file position
set ruler

" Display as much of the last line in a window as possible
set display+=lastline

" Abbreviate some messages, hide others
set shortmess+=atItToO

" Always show status line
set laststatus=2

" Simple display, no unnecessary frills
set fillchars=

" Show whitespace as unicode chars
if (&termencoding == 'utf-8') || has('gui_running')
  set showbreak=↪

  set listchars=tab:»·,extends:…,precedes:…,eol:¬

  if v:version >= 700
    set listchars+=nbsp:‗
  endif

  " Show trailing whitespace this way if we aren't highlighting it in color
  if (! has('gui_running')) && (&t_Co < 3)
    set listchars+=trail:·
  endif
else
  let &showbreak = '> '

  set listchars=tab:>-,extends:>,precedes:<

  if v:version >= 700
    set listchars+=nbsp:_
  endif

  " Show trailing whitespace this way if we aren't highlighting it in color
  if (! has('gui_running')) && (&t_Co < 3)
    set listchars+=trail:.
  endif
endif

if &term == 'xterm-256color'
  set t_Co=256
endif

" Make sure the gui is initialized before setting up colors
if has('gui_running')
  gui
endif

set background=dark
colorscheme baycomb
