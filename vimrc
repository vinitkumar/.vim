set encoding=utf-8
call plug#begin('~/.vim/plugged')

" Plugs {
  "Plug 'bling/vim-airline'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/landscape.vim'
  Plug 'w0rp/ale'
  Plug 'wincent/terminus'
  Plug 'rizzatti/dash.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'fatih/vim-go'
  Plug 'tpope/vim-fugitive'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'Valloric/YouCompleteMe'
  Plug 'rust-lang/rust.vim'
  Plug 'wakatime/vim-wakatime'
  Plug '/usr/local/opt/fzf'
  Plug 'mattn/webapi-vim'
  Plug 'vimwiki/vimwiki'
  Plug 'mattn/gist-vim'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf.vim'
  Plug 'prettier/vim-prettier'
  Plug 'ararslan/license-to-vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'sheerun/vim-polyglot'
  Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

" set colorscheme

"set guifont=Inconsolata\ for\ Powerline:h14
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" Map the leader key to ,
let mapleader=","
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>


" General {
  set t_Co=256
  set backspace=indent,eol,start      " Allow backspace over everything in insert mode.
  set background=dark
  set noswapfile
  set smarttab
  set lazyredraw
  set secure
  set exrc
  set cursorline
  set ttyfast
  set noautoindent        " I indent my code myself.
  set nocindent           " I indent my code myself.
  set omnifunc=syntaxcomplete#Complete
  set nrformats-=octal
  set timeout
  set timeoutlen=100
  set hlsearch            " Highlight search results.
  set ignorecase          " Make searching case insensitive
  set smartcase           " ... unless the query has capital letters.
  set incsearch           " Incremental search.
  set gdefault            " Use 'g' flag by default with :s/foo/bar/.
  set magic               " Use 'magic' patterns (extended regular expressions).

  set showcmd             " Show (partial) command in status line.
  set colorcolumn=100
  set showmatch           " Show matching brackets.
  set showmode            " Show current mode.
  set ruler               " Show the line and column numbers of the cursor.
  set number              " Show the line numbers on the left side.
  set formatoptions+=o    " Continue comment marker in new lines.
  set textwidth=0         " Hard-wrap long lines as you type them.
  set expandtab           " Insert spaces when TAB is pressed.
  set tabstop=2           " Render TABs using this many spaces.
  set shiftwidth=2        " Indentation amount for < and > commands.
  map <D-d> yyp
  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
  set esckeys             " Cursor keys in insert mode.
  set linespace=0         " Set line-spacing to minimum.
  set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
  set splitbelow          " Horizontal split below current.
  set splitright          " Vertical split to right of current.
  set autoread            " If file updates, load automatically.
  " Reload vim whenever the config files changes
  au! BufWritePost .vimrc so %
  au! BufWritePost .gvimrc so %

  set display+=lastline
  set nostartofline       " Do not jump to first character with page commands.

  if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
  endif

  " Also highlight all tabs and trailing whitespace characters.
  highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
  match ExtraWhitespace /\s\+$\|\t/

" }

" Configuration {
  if has('path_extra')
    setglobal tags-=./tags tags^=./tags;
  endif


  " Remove special characters for filename
  set isfname-=:
  set isfname-==
  set isfname-=+

  " Map ; to :
  nnoremap ; :

  if &history < 1000
    set history=1000      " Number of lines in command history.
  endif
  if &tabpagemax < 50
    set tabpagemax=50     " Maximum tab pages.
  endif

  if &undolevels < 200
    set undolevels=200    " Number of undo levels.
  endif

  " Path/file expansion in colon-mode.
  set wildmenu
  set wildmode=list:longest
  set wildchar=<TAB>

  if !empty(&viminfo)
    set viminfo^=!        " Write a viminfo file with registers.
  endif
  set sessionoptions-=options

  autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab fileformat=unix


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

  " Diff options
  set diffopt+=iwhite

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

" GUI Options {
  set guioptions-=m " Removes top menubar
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar

  "Toggle menubar
  nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

  " Relative numbering
  function! NumberToggle()
    if(&relativenumber == 1)
      set nornu
      set number
    else
      set rnu
    endif
  endfunc

  " Toggle between normal and relative numbering.
  nnoremap <leader>r :call NumberToggle()<cr>

  " Sets a status line. If in a Git repository, shows the current branch.
  " Also shows the current file name, line and column number.
 if has('statusline')
      set laststatus=2

      " Broken down into easily includeable segments
      set statusline=%<%F\                     " Filename
      set statusline+=%w%h%m%r                 " Options
      "set statusline+=%{fugitive#statusline()} " Git Hotness
      set statusline+=\ [%{&ff}/%Y]            " Filetype
      set statusline+=\ [%{getcwd()}]          " Current dir
      set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif
" }

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

let g:lightline = {
      \ 'colorsheme': 'landscape',
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%:p:h')
endfunction


autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType go set sw=4
autocmd FileType go set tabstop=4
autocmd FileType go set sts=0
autocmd FileType go set expandtab
autocmd FileType go set smarttab
autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType json setlocal expandtab sw=2 ts=2 sts=2
"autocmd FileType p/ython setlocal expandtab sw=4 ts=4 sts=4
autocmd FileType c setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType php setlocal expandtab sw=2 ts=2 sts=2
autocmd BufNewFile,BufReadPost *.jade set filetype=pug
autocmd FileType jade setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType html setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType jade setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType less setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType htmldjango setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType css setlocal expandtab sw=2 ts=2 sts=2
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def-tab)
augroup filetype
 au! BufRead,BufNewFile *.proto setfiletype proto
augroup end


" Vim-Go related Settings
let g:go_errcheck_bin="/Users/vinitkumar/go/bin/errcheck"
let g:go_golint_bin="/Users/vinitkumar/go/bin/golint"
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:github_upstream_issues = 1
let g:go_disable_autoinstall = 0


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildignore+=*/node_modules/*     " Don't search inside Node.js modules
set wildignore+=*/bower_components/* " Don't search inside bower modules

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>


"Indent
" Indent lines with cmd+[ and cmd+]
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

set rtp+=/usr/local/opt/fzf

" Recommended key-mappings.
" <CR>: close popup and save indent.

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" Make vim faster in iterm/Terminal.app
let g:ale_python_flake8_args="--ignore=E501"

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'swift': ['swiftlint'],
\   'python': ['mypy'],
\   'typescript': ['tslint'],
\}

let g:ale_python_pylint_args="--load-plugins pylint_django"

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic cterm=italic
let g:jsx_ext_required = 0
let g:typescript_compiler_binary = 'tsc'
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

