nnoremap <leader>ff :Autoformat<CR>
au BufWrite * :Autoformat<CR>

" Go
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
