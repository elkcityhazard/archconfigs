let s:plugin_dir = expand('~/.vim/plugged')

function! s:update_plugin(repo)
  let name = split(a:repo, '/')[-1]
  let path = s:plugin_dir . '/' . name
  execute '!cd ' . shellescape(path) . ' && git pull'
endfunction

function! s:ensure(repo)

  let name = split(a:repo, '/')[-1]
  let path = s:plugin_dir . '/' . name

  if !isdirectory(path)
    if !isdirectory(s:plugin_dir)
      call mkdir(s:plugin_dir, 'p')
    endif
    execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
  endif

  execute 'set runtimepath+=' . fnameescape(path)
endfunction

call s:ensure('rose-pine/vim')
call s:ensure('junegunn/fzf')
call s:ensure('junegunn/fzf.vim')
call s:ensure('itchyny/lightline.vim')
call s:ensure('yegappan/lsp')
call s:ensure('neoclide/coc.nvim')
call s:ensure('neoclide/coc-sources')
call s:ensure('vim-autoformat/vim-autoformat')

call s:update_plugin('rose-pine/vim')
call s:update_plugin('junegunn/fzf')
call s:update_plugin('junegunn/fzf.vim')
call s:update_plugin('itchyny/lightline.vim')
call s:update_plugin('yegappan/lsp')
call s:update_plugin('neoclide/coc.nvim')
call s:update_plugin('neoclide/coc-sources')
