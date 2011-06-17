" Execute a command, preserving search and cursor position
"   Courtesy vimcasts / http://bit.ly/gktKmH
function! Preserve(command)
  let _s = @/
  let l = line(".")
  let c = col(".")

  execute a:command

  let @/ = _s
  call cursor(l, c)
endfunction
