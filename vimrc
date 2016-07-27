set nocompatible
syntax on
set nu
filetype indent plugin on
nnoremap <silent> <F4> :set cursorline!<CR>
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
execute pathogen#infect()
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set rtp+=/Users/chris/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set laststatus=2
