" Plugs {
call plug#begin('~/.vim/plugged')
  "Autocomplete and linting
  Plug 'Valloric/YouCompleteMe'
  Plug 'w0rp/ale'
  " Search files
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  " UI
  Plug 'joshdick/onedark.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'vim-airline/vim-airline'
  Plug 'jordwalke/VimSplitBalancer'
  " Git and Commenting
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
      if has('nvim')
        !cargo build --release
      else
        !cargo build --release --no-default-features --features json-rpc
      endif
    endif
  endfunction

  " Latex & markdown editing
  Plug 'lervag/vimtex', { 'for': 'tex'}
  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer'), 'for': 'markdown'}
  Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
call plug#end()


