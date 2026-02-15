"Osc52Yank pipes the clipboard into Osc52 so you can yank from the remote to the host machine
function! Osc52Yank()
 "Get whatever is in the current register and base64 it
  let buffer=system('base64 -w0', @0)
 "Cleans the output trimming new line characters
  let buffer=substitute(buffer, "\n$", "", "")
 "Builds the escape sequence to tell terminal to trigger a clipboard copy
  let buffer='\e]52;c;'.buffer.'\x07'
  "Send the buffer to the terminal
  silent exe "!echo -ne ".shellescape(buffer)."> ".shellescape("/dev/tty")
endfunction

"Creates the Osc52CopyYank command i.e., :Osc52Copy
command! Osc52CopyYank call Osc52Yank()

"add the tty yank func to autocmd when you yank
augroup megalawnalien "group this in MCCALLA group
    "clear any previous commands in group
    autocmd!
    "after yank,del,change, check if yanked and call the func
        autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
        augroup END
