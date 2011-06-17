let mapleader = ","
let maplocalleader = ","

" Paste mode
set pastetoggle=<Leader>P

" Fast saving
nmap <leader>w :w!<cr>

" Spelling
nmap <silent> <leader>ss :set spell!<CR>

" Toggle display of newlines, hard tabs, etc
nmap <leader>l :set list!<CR>

" Open a file in the same directory as the current file
nmap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Default to navigating by virtual lines, using the 'g' versions to move by
" physical lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Make 'Y' follow 'D' and 'C' conventions
nnoremap Y y$

" Select just-pasted text
nnoremap <leader>v V`]

" Ctrl+return to add a new line below the current line in insert mode
inoremap <c-cr> <esc>A<cr>

" Delete trailing whitespace
nmap <leader>dtw :%s/\s\+$//<CR>

" Plugins
nmap <leader>im :Modeliner<CR>

nnoremap <Leader>f :ToggleNERDTree<Enter>
nnoremap <Leader>F :NERDTreeFind<Enter>

" Taglist
nnoremap <Leader>T :TlistToggle<Enter>

" YankRing
nnoremap <silent> <Leader>yr :YRGetElem<CR>
