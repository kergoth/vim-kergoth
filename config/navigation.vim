" Default folding settings, enabled, indent based, all open
if has('folding')
  set foldenable
  set foldcolumn=0
  set foldminlines=1
  set foldmethod=indent
  set foldlevel=99
  set foldlevelstart=99
endif

" Automatically write buffers on switch/make/exit
set nohidden
set autowrite
set autowriteall

" Buffer switching behaviors
" useopen   If included, jump to the first open window that
"           contains the specified buffer (if there is one).
" split     If included, split the current window before loading a buffer
set switchbuf+=useopen
" set switchbuf+=split

" No incremental searches or search highlighting
set noincsearch
set nohlsearch

" More bash-like tab completion
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.o,*~,*.swp,*.bak,*.pyc,*.pyo

" Return cursor to start of edit after repeat
nmap . .`[

" Ignore case on search unless search has uppercase characters
set ignorecase
set smartcase
set infercase

" Fast terminal, bump sidescroll to 1
set sidescroll=1

" Show 2 rows/cols of context when scrolling
set scrolloff=2
set sidescrolloff=2

" Keep cursor in the same column if possible (see help).
set nostartofline
