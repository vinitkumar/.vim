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
  Plug 'rust-lang/rust.vim'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown'] }
  Plug 'ambv/black'
call plug#end()


