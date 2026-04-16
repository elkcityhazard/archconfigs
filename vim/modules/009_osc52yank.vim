function! Osc52Yank()
  let buffer = system('base64 -w0', @")
  let buffer = substitute(buffer, "\n$", "", "")
  let buffer = '\e]52;c;' . buffer . '\x07'
  silent exe "!echo -ne " . shellescape(buffer) . " > /dev/tty"
endfunction
command! Osc52CopyYank call Osc52Yank()
augroup megalawnalien
  autocmd!
  autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
augroup END

