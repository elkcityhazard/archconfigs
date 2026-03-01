function s:sourceModules()
  let files = globpath('./modules','*',1,1)
  for f in files
    let cwd = getcwd()
    let splitstr = f[1:len(f)-1]
    let module = cwd  . splitstr
    exe 'source' module
  endfor
endfunction

echo s:sourceModules() 
