syntax sync fromstart
if has("syntax")
    syntax sync fromstart
    syntax on
    set background=dark
    highlight SpellBad ctermfg=red ctermbg=black term=Underline
endif


call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim', {'branch': 'master'}
  Plug 'antoinemadec/coc-fzf'
  Plug 'neoclide/coc.nvim', {'branch': 'master'}
  Plug 'vinitkumar/vim-ripgrep'
  Plug 'mileszs/ack.vim'
  Plug 'yggdroot/indentline' " visualize indentation levels
  Plug 'vimwiki/vimwiki'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
  Plug 'preservim/tagbar'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'rizzatti/dash.vim'
  Plug 'savq/melange'
  Plug 'ziglang/zig.vim'
call plug#end()


" Put the current date in insert mode
imap <C-d> <ESC>:r! date<CR>kJ$a
vmap <TAB> >gv

nmap <F8> :TagbarToggle<CR>



set softtabstop=4
set shiftwidth=4
set expandtab
set switchbuf=useopen
set showtabline=2
set switchbuf=useopen
set cursorline
set nobackup
set noswapfile
set nowritebackup
set showcmd
" highlight matches with last search pattern
" set hls

set incsearch		" incremental search
set ignorecase		" ignore the case
set smartcase		" don't ignore the case if the pattern is uppercase
set laststatus=2	" show the status bar even with one buffer
set number
set relativenumber
set ruler		" show cursor position
set showmode		" show the current mode
set wildmode=longest,list
set wildmenu

"set showmatch		" show the matching ( for the last )
" set viminfo=%,'50,\"100,:100,n~/.viminfo	"info to save accross sessions
set autoindent
"set backspace=2
set backspace=indent,eol,start
set virtualedit=all
set noswapfile
normal mz

set list
set listchars=tab:›\ ,eol:¬,trail:⋅
set scrolloff=10

func! Python_init()
  setlocal shiftwidth=4 tabstop=4 softtabstop=4 "standard PEP8 Tab length
  setlocal smartindent "use the keywords below to add additional indentation
  setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
  "smartindent is OK but don't move # comments to the first column please:
  inoremap # X#
  setlocal formatoptions=cq12 textwidth=79 "wrap lines longer than 79 characters
  setlocal nowrap "don't wrap source code, it's evil
  setlocal noignorecase nosmartcase "avoid corrupting source code on search/replace operations
endfunc


" change filetypes for common files
augroup filetypedetect
au BufNewFile,BufRead *.md     set filetype=markdown softtabstop=4 shiftwidth=4
autocmd BufWinEnter,FileType *.{md,wiki} colorscheme naysayer88
au Filetype gitcommit setlocal spell textwidth=72
au FileType javascript setlocal expandtab sw=2 ts=2 sts=2
au FileType typescript setlocal expandtab sw=2 ts=2 sts=2
au FileType json setlocal expandtab sw=2 ts=2 sts=2
au FileType c setlocal expandtab sw=2 ts=2 sts=2
au FileType html setlocal expandtab sw=2 ts=2 sts=2
au FileType htmldjango setlocal expandtab sw=2 ts=2 sts=2
au FileType scss setlocal expandtab sw=2 ts=2 sts=2
au FileType sass setlocal expandtab sw=2 ts=2 sts=2
au FileType htmldjango setlocal expandtab sw=2 ts=2 sts=2
au FileType css setlocal expandtab sw=2 ts=2 sts=2
au bufnewfile,bufread *.tsx set filetype=typescript.tsx
au BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
au BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
au BufNewFile,BufReadPost *.jade set filetype=pug
au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au bufnewfile,bufread *.jsx set filetype=javascript.tsx
au FileType typescript autocmd CursorHold <buffer> :silent :wa
au FileType python call Python_init()
augroup END



" Collection of all the maps
let mapleader=","
map <C-p> :Files<CR>
nmap <C-b> :Buffers<CR>
nmap <C-c> :Commits<CR>
nmap <C-t> :tabNext<CR>
nmap <C-e> :CocDiagnostics<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gr <Plug>(coc-references))
nmap <leader>ev :vsplit $MYVIMRC<CR>

:nnoremap <leader>dt "=strftime("%c")<CR>P
:inoremap <leader>dt <C-R>=strftime("%c")<CR>

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

"tab management, leader-t to generate a new tab and Control-t to switch
"between them
noremap <Leader>t :<C-u>tabnew<CR>

" Map ; to :
nnoremap ; :


" When open a new file remember the cursor position of the last editing
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

" Colors
" :hi Comment term=bold ctermfg=Cyan ctermfg=#80a0ff

" Macro

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



set laststatus=2

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


" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


function! ChangeBackground()
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark   " for dark version of theme
    colorscheme grb-lucius
  else
    set background=light  " for light version of theme
    colorscheme grb-lucius
  endif
endfunction

" initialize the colorscheme for the first run
call ChangeBackground()





set mouse=a
set background=dark
colorscheme base16-bright
set termguicolors
let base16colorspace=256

" fix for kitty in vim
let &t_ut=''
