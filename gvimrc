" Some macvim specific general settings to hide some menu and whatnot
source ~/.vim/parts/gvim_general.vim
" The colorscheme and font related settings
source ~/.vim/parts/gvimui.vim

" Autoreload Macvim whenever one of the settings is changed
au! BufWritePost .gvimrc so %
