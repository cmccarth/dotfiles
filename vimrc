if has("autocmd")
  filetype indent plugin on
endif
nnoremap <silent> <F4> :set cursorline!<CR>
set cursorline
set expandtab
set nocompatible
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4
execute pathogen#infect()
syntax on
