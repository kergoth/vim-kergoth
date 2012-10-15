let g:doxygen_enhanced_color = 0
let g:loaded_AlignMapsPlugin = '1'
let g:pyflakes_use_quickfix = 0
let g:NTPNames = ['build.xml', 'Makefile', '.project', '.lvimrc', 'SConstruct',
                \ 'CMakeLists.txt', 'setup.py', 'configure.ac', 'configure.in']
let g:session_autosave = 1
let g:session_autoload = 0
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_Color = 0
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 1
if has('file_in_path')
  let miscdir = finddir("misc", &runtimepath)
  if miscdir
    let g:lua_inspect_path = miscdir
  endif
endif
if !has('lua') && !executable('lua')
  let g:loaded_luainspect = 1
endif
let g:SuperTabDefaultCompletionType = 'context'
let g:CSApprox_verbose_level = 0
let g:pylint_onwrite = 0
let g:syntastic_disabled_filetypes = ['python']
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
let g:LargeFile = 10
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
let g:NERDCommentWholeLinesInVMode = 1
let g:NERDTreeQuitOnOpen = 1
let g:Modeliner_format = 'fenc= sts= sw= ts= et'

let g:Tlist_Ctags_Cmd = 'ctags'
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Show_Menu = 0
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_WinWidth = 28
let g:Tlist_Compact_Format = 1
let g:Tlist_File_Fold_Auto_Close = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Sort_Type = 'order'
let g:Tlist_Close_On_Select = 0
if has('gui_running')
  let g:Tlist_Inc_Winwidth = 1
else
  let g:Tlist_Inc_Winwidth = 0
endif

let g:bufExplorerDefaultHelp = 0
let g:bufExplorerSortBy = 'mru'
let g:bufExplorerSplitType = 'v'
let g:bufExplorerOpenMode = 1
