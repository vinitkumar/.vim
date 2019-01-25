" Collection of all the maps
let mapleader=","
map <C-p> :Files<CR>
nmap <C-b> :Buffers<CR>

" Keybindings {
  " Save file
  nnoremap <Leader>w :w<CR>
  "Copy and paste from system clipboard
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P
" }

  "Enter to go to EOF and backspace to go to start
nnoremap <CR> G
nnoremap <BS> gg
" Stop cursor from jumping over wrapped lines
nnoremap j gj
nnoremap k gk
  " Make HOME and END behave like shell
inoremap <C-E> <End>
inoremap <C-A> <Home>
" }

"Toggle menubar
nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Map ; to :
nnoremap ; :


