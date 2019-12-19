  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

call plug#begin('~/.vim/plugged')
  Plug 'dense-analysis/ale'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Load Plug plugin and define the plugins to be used
" General settings
source ~/.vim/parts/general.vim
" UI settings, deals with theme, font etc
source ~/.vim/parts/pluginconf.vim
source ~/.vim/parts/ui.vim
" All autocmds are here.
source ~/.vim/parts/autocmd.vim
" Plugin specific tunings are here
" All the mappings are done here
source ~/.vim/parts/mappings.vim
" some misc plugins/ functions picked/borrowed from the Internets
source ~/.vim/parts/misc.vim


set rtp+=/usr/local/opt/fzf
au! BufWritePost ~/.vim/parts/general.vim  so %
au! BufWritePost ~/.vim/parts/ui.vim  so %
au! BufWritePost ~/.vim/parts/autocmd.vim  so %
au! BufWritePost ~/.vim/parts/pluginconf.vim  so %
au! BufWritePost ~/.vim/parts/mappings.vim  so %
au! BufWritePost ~/.vim/parts/misc.vim  so %

au! BufWritePost ~/.config/nvim/init.vim so %


set guifont=Inconsolata-g:h15
