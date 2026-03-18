nnoremap <leader>pf :Files<CR>
nnoremap <leader>po :History<CR>
nnoremap <leader>pb :Buffer<CR>
nnoremap <leader>pq :CList<CR>
nnoremap <leader>ph :Helptags<CR>

nnoremap <leader>ps :Rg<Space>

" Grep current string
nnoremap <leader>fs :Rg 'RG '<C-r><C-w><CR>


" Grep for current file name (without extension)
nnoremap <leader>pc :execute 'RipGrep ' . expand('%:t:r')<CR>

" Find files in your Vim config
nnoremap <leader>pi :Files ~/.config/vim<CR>
