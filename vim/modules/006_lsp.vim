" Enable diagnostics highlighting
let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)
let lspServers = [
      \ #{
      \   name: 'rust-analyzer',
      \   filetype: ['rust'],
      \   path: 'rust-analyzer',
      \   args: []
      \ },
      \#{
      \   name: "golang",
      \   filetype: ['go','gomod'],
      \   path: '/usr/sbin/gopls',
      \   args: ['serve'],
      \   syncInit: v:true
      \ },
      \ #{name: 'vimls',
      \   filetype: 'vim',
      \   path: '/usr/sbin/vim-language-server',
      \   args: ['--stdio']
      \ },
      \ #{
	    \    name: 'typescriptlang',
	    \    filetype: ['javascript', 'typescript'],
	    \    path: '/usr/sbin/typescript-language-server',
      \    args: ['--stdio'],
	    \  },
      \ #{
      \    name: 'clangd',
      \    filetype: ['c', 'cpp'],
      \    path: '/usr/sbin/clangd',
      \    args: ['--background-index']
      \  },
      \ #{
      \   name: "vscode-html-languageserver",
      \   filetype: ['html','gohtml'],
      \   path: '/usr/sbin/vscode-html-languageserver',
      \   args:['--stdio'] 
      \  },
      \ #{
      \   name: 'docker-compose',
      \   filetype: ['yaml.docker-compose'],
      \   path: '/usr/bin/docker-compose-langserver',
      \   args: ['--stdio'],
      \   rootPatterns: ['.git','.env','docker-compose.yml','docker-compose.yaml','compose.yml','compose.yaml'],
      \  }
      \ ]

autocmd User LspSetup call LspAddServer(lspServers)

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap gl :LspDiag current<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>

" Set omnifunc for completion
autocmd FileType php setlocal omnifunc=lsp#complete

" Custom diagnostic sign characters
autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \ })
