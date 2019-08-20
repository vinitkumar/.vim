" Plugs {
call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'w0rp/ale'
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/YouCompleteMe'
  Plug '/usr/local/opt/fzf'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf.vim'
  Plug 'machakann/vim-highlightedyank'
  " Plug 'rust-lang/rust.vim'
  Plug 'jordwalke/VimSplitBalancer'
  Plug 'lervag/vimtex', { 'for': 'tex'}
  Plug 'leafgarland/typescript-vim'
  function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
  Plug 'junegunn/goyo.vim'
  Plug 'reasonml-editor/vim-reason-plus'
  Plug 'joshdick/onedark.vim'
call plug#end()


