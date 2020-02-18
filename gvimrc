" Some macvim specific general settings to hide some menu and whatnot
set guifont=SF\ Mono:h14
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
syntax on
set termguicolors
" for dark version
set background=dark
colorscheme desert
set linespace=0
au! BufWritePost .gvimrc so %
