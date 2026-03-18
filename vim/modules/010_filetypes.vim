" docker compose

au FileType yaml if bufname("%") =~# "docker-compose.yml" | set ft=yaml.docker-compose | endif
au FileType yaml if bufname("%") =~# "compose.yml" | set ft=yaml.docker-compose | endif

" Register gohtml as a filetype and aliast to html for syntax highlighting
autocmd BufRead,BufNewFile *.gohtml setfiletype html
au BufRead,BufNewFile *.gohtml setfiletype gohtml


let g:coc_filetype_map = {
  \ 'yaml.docker-compose': 'dockercompose',
  \ }
