" s:sourceModules globs for .vim files in the specified directory and attempts to source them
function! s:sourceModules(basePath, modulePath)
  let l:cleanBasePath = fnamemodify(a:basePath, ':p')
  let l:cleanModulePath = fnamemodify(a:modulePath, ':p')
  let l:fullPath = l:cleanBasePath . l:cleanModulePath
  let files = globpath(l:fullPath, '*.vim', 1, 1)
  for f in files
    echo f
    exe 'source' f
  endfor
endfunction

call s:sourceModules(expand('<sfile>:p:h'), '/.config/vim/modules')

