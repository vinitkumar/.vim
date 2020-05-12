" Some macvim specific general settings to hide some menu and whatnot
set guifont=Source\ Code\ Pro\ For\ Powerline:h16
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
syntax on
set termguicolors
" for dark version
set linespace=0
au! BufWritePost .gvimrc so %
colorscheme base16-gruvbox-dark-hard
set background=dark
" Give the active window a blue background and white foreground
