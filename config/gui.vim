"set guioptions=egmrt
set guioptions=Acgae

" Default window size
" Behavior of full screen mode
try
  set fuoptions=maxvert,maxhorz
catch
endtry

" In order of preference, best to worst
let g:fonts = ['Consolas', 'Inconsolata', 'Menlo', 'DejaVu Sans Mono',
            \  'Monaco', 'Andale Mono', 'Courier']
let g:gtkfont = 'Inconsolata'
let g:fontsize = '13'

" Set up our fonts based upon the above configuration variables
fun! SetFonts()
  if !exists('g:gtkfont')
    let gconf_path = '/desktop/gnome/interface/monospace_font_name'
    let gconf_font = system('gconftool --get ' . gconf_path)
    let g:gtkfont = substitute(gconf_font, '\n', '', '')
  endif

  if has('gui_gtk2')
    let &guifont = g:gtkfont . ' ' . g:fontsize
  else
    let fontstrings = []
    for font in g:fonts
      if has('macunix') && has('gui')
        let fontstrings += [font . ':h' . g:fontsize]
      elseif has('gui_win32')
        let fontstrings += [font . ':h' . g:fontsize . 'cANSI']
      endif
    endfor
    let &guifont = join(fontstrings, ',')
  endif
endfun

augroup GuiSettings
  au!
  au GUIEnter * if empty(&guifont) | call SetFonts() | endif
  " Default window size
  au VimEnter * set lines=50 columns=112
augroup END
