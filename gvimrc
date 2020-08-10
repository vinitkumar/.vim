" Some macvim specific general settings to hide some menu and whatnot
set guifont=Source\ Code\ Pro\ For\ Powerline:h18
" set guifont=Inconsolata-g:h14
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
syntax on
set termguicolors
" for dark version
set linespace=0
au! BufWritePost .gvimrc so %
colorscheme solarized
set background=dark
