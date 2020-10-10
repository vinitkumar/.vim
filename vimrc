syntax sync fromstart
if has("syntax")
    syntax sync fromstart
    syntax on
    set background=dark
    highlight SpellBad ctermfg=red ctermbg=black term=Underline
endif


call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-commentary'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim', {'branch': 'master'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'govim/govim'
  Plug 'jonathanfilip/vim-lucius'
  Plug 'vimwiki/vimwiki'
  Plug 'preservim/tagbar'
  Plug 'machakann/vim-highlightedyank'
call plug#end()


" Put the current date in insert mode
imap <C-d> <ESC>:r! date<CR>kJ$a
vmap <TAB> >gv

set softtabstop=4
set shiftwidth=4
set expandtab

" highlight matches with last search pattern
" set hls

set incsearch		" incremental search
set ignorecase		" ignore the case
set smartcase		" don't ignore the case if the pattern is uppercase
"set laststatus=2	" show the status bar even with one buffer
" set number
" set relativenumber
set ruler		" show cursor position
set showmode		" show the current mode
"set showmatch		" show the matching ( for the last )
" set viminfo=%,'50,\"100,:100,n~/.viminfo	"info to save accross sessions
set autoindent
set backspace=2
set virtualedit=all
set noswapfile
normal mz

set list
set listchars=tab:›\ ,eol:¬,trail:⋅
set updatetime=1000
set scrolloff=10

" change filetypes for common files
augroup filetypedetect
au BufNewFile,BufRead *.md     set filetype=markdown softtabstop=4 shiftwidth=4
au Filetype gitcommit setlocal spell textwidth=72
au FileType javascript setlocal expandtab sw=2 ts=2 sts=2
au FileType json setlocal expandtab sw=2 ts=2 sts=2
au FileType c setlocal expandtab sw=2 ts=2 sts=2
au BufNewFile,BufReadPost *.jade set filetype=pug
au FileType html setlocal expandtab sw=2 ts=2 sts=2
au FileType scss setlocal expandtab sw=2 ts=2 sts=2
au FileType sass setlocal expandtab sw=2 ts=2 sts=2
au FileType htmldjango setlocal expandtab sw=2 ts=2 sts=2
au FileType css setlocal expandtab sw=2 ts=2 sts=2
au BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
au BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
" Don't syntax highlight markdown because it's often wrong
" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.tsx
" Two-space indents in TypeScript
autocmd! FileType typescript set sw=2 sts=2 expandtab
" Automatically write after inactivity in TypeScript
autocmd FileType typescript autocmd CursorHold <buffer> :silent :wa
augroup END



" Collection of all the maps
let mapleader=","
map <C-p> :Files<CR>
nmap <C-b> :Buffers<CR>
nmap <C-c> :Commits<CR>
nmap <C-t> :Colors<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references))

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


noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Map ; to :
nnoremap ; :


nmap tt :TagbarToggle<CR>

" When open a new file remember the cursor position of the last editing
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

" Colors
" :hi Comment term=bold ctermfg=Cyan ctermfg=#80a0ff

" Macro

" Vim 7.0 stuff
let loaded_matchparen = 1   " Avoid the loading of match paren plugin
:filetype plugin on
" :source /usr/share/vim/vim72/macros/matchit.vim

" highlight OverLength ctermbg=red ctermfg=white ctermbg=#592929
" match OverLength /\%81v.*/

" Status Line
set laststatus=2

" Remove trailing spaces before saving text files
" http://vim.wikia.com/wiki/Remove_trailing_spaces
autocmd BufWritePre * :call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    if &filetype == 'mail'
" Preserve space after e-mail signature separator
      %s/\(^--\)\@<!\s\+$//e
    else
      %s/\s\+$//e
    endif
    normal 'yz<Enter>
    normal `z
  endif
endfunction


hi User1 ctermfg=green ctermbg=black
hi User2 ctermfg=yellow ctermbg=black
hi User3 ctermfg=red ctermbg=black
hi User4 ctermfg=blue ctermbg=black
hi User5 ctermfg=white ctermbg=black

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
au! BufWritePost .vimrc so %

let g:fzf_preview_window = ''

:color grb-lucius
GrbLuciusDarkHighContrast

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-ALE CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

let g:highlightedyank_highlight_duration = 2000
