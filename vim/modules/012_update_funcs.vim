let s:plugin_dir = expand('~/.vim/plugged')

function! s:update_plugin(repo)
  let name = split(a:repo, '/')[-1]
  let path = s:plugin_dir . '/' . name
  if !isdirectory(path)
    return
  endif
  silent call system('cd ' . shellescape(path, 1) . ' && git pull 2>&1')
endfunction

call s:update_plugin('rose-pine/vim')
call s:update_plugin('junegunn/fzf')
call s:update_plugin('junegunn/fzf.vim')
call s:update_plugin('itchyny/lightline.vim')
call s:update_plugin('yegappan/lsp')
call s:update_plugin('neoclide/coc.nvim')
call s:update_plugin('neoclide/coc-sources')
call s:update_plugin('vim-autoformat/vim-autoformat')
