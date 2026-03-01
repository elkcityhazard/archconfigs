function s:sourceModules()

  let l:basePath   = expand('<sfile>:p:h')
  let l:modulePath = '/.config/vim/modules'
  let l:fullPath   = l:basePath . l:modulePath
  let files = globpath(l:fullPath, '*.vim',1,1)
  for f in files
	echo f
    let l:splitstr = f[1:len(f)-1]
    exe 'source' f
  endfor
endfunction

echo s:sourceModules() 
