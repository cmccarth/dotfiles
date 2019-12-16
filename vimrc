if has("autocmd")
  filetype indent plugin on
endif
nnoremap <silent> <F4> :set cursorline!<CR>
set background=light
set cursorline
set expandtab
set nocompatible
set number
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4
execute pathogen#infect()
colo old-hope
syntax on
