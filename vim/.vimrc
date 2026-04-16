" s:sourceModules globs for .vim files in the specified directory and attempts to source them
function! s:sourceModules(basePath, modulePath)
  let l:cleanBasePath = fnamemodify(a:basePath, ':p:h')
  let l:cleanModulePath = fnamemodify(a:modulePath, ':p')
  let l:fullPath = l:cleanBasePath . l:cleanModulePath
  let files = globpath(l:fullPath, '*.vim', 1, 1)
  for f in files
    exe 'source' f
  endfor
endfunction

call s:sourceModules(expand('<sfile>'), '/.config/vim/modules')

" check your remaps using :verbose nnoremap <leader>pf for example to see if you have conflicts 
"echom 'version 0.0.1'
source ~/.config/vim/modules/server.vim
source ~/.config/vim/modules/keybind.vim
source ~/.config/vim/modules/plugin.vim
source ~/.config/vim/modules/colors.vim
source ~/.config/vim/modules/fzf.vim
source ~/.config/vim/modules/lightline.vim
source ~/.config/vim/modules/lsp.vim
 source ~/.config/vim/modules/coc-vim.vim
