" Plugs {
call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'w0rp/ale'
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/YouCompleteMe'
  Plug 'wakatime/vim-wakatime'
  Plug '/usr/local/opt/fzf'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf.vim'
  Plug 'machakann/vim-highlightedyank'
  " Plug 'rust-lang/rust.vim'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown'] }
  Plug 'jordwalke/VimSplitBalancer'
  Plug 'ambv/black', { 'for': 'python'}
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'lervag/vimtex', { 'for': 'tex'}
  Plug 'lifepillar/vim-solarized8'
call plug#end()


