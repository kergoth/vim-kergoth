" Don't use old weak encryption for Vim 7.3
if has('cryptv')
  try
    set cryptmethod=blowfish
  catch
  endtry
endif
