set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add Bundles below
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'sjl/badwolf'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'wakatime/vim-wakatime'
Plugin 'vinitkumar/vim-misc'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mitsuhiko/fruity-vim-colorscheme'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'exu/pgsql.vim'
Plugin 'mitsuhiko/vim-python-combined'


let g:airline_theme             = 'badwolf'
let g:airline#extensions#syntastic#enabled = 1
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

set nu
set mouse=a
set background=dark
colorscheme fruity
let g:colors_name="molokai"
set guifont=Inconsolata\ for\ Powerline:h14
set antialias
set backspace=2  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set scrolloff=999               " Minimum lines to keep above and below cursor
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set splitbelow
set splitright
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=100 " Increase history from 20 default to 1000
set laststatus=2 " Always show status line
set nocompatible " Make vim more useful
set noerrorbells " Disable error bells.
set nostartofline
set ruler " Show the cursor position
set title " Show the filename in the window titlebar.
scriptencoding utf-8
" Disable the scrollbars
set guioptions-=r
set guioptions-=L
set encoding=utf-8
set nobackup
set noswapfile
set pastetoggle=<F2>
nnoremap ; :
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>
nmap <silent> <leader>vimrc :e ~/.vimrc<CR>
map <leader>y "*y
map <leader>p "*p
cmap w!! %!sudo tee > /dev/null %
autocmd BufWritePre * :%s/\s\+$//e

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/vimrc')
    source $VIRTUAL_ENV/vimrc
endif


" SimpleFold related settings # Maybe
nnoremap <space> za
vnoremap <space> zf
let g:indentobject_meaningful_indentation = ["python", "markdown", "ocaml"]
autocmd FileType python setlocal completeopt-=preview


if &term == 'xterm' || &term == 'screen'
	set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif


" Gist related settings

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1

" Colorcolumns
if version >= 703
  autocmd FileType * setlocal colorcolumn=0
  " autocmd FileType ruby,python,javascript,c,cpp,objc,rst
  "  \ let &colorcolumn="80,".join(range(84,300),",")
  autocmd FileType ruby,python,javascript,c,cpp,objc,rst let &colorcolumn="80"
endif

" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
\ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

let g:syntastic_python_checkers=['flake8', 'python']

" Don't warn on
"   E121 continuation line indentation is not a multiple of four
"   E128 continuation line under-indented for visual indent
"   E711 comparison to None should be 'if cond is not None:'
"   E301 expected 1 blank line, found 0
"   E261 at least two spaces before inline comment
"   E241 multiple spaces after ':'
"   E124 closing bracket does not match visual indentation
"   E126 continuation line over-indented for hanging indent
"   E721 do not compare types, use 'isinstance()'
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
    \ --max-line-length=84'


"Nerdtree
"nmap <C-u> :NERDTreeToggle<CR>
"let NERDTreeIgnore = ['\.pyc$']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Spell check always on
set spell spelllang=en_us

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType go set sw=4
autocmd FileType go set tabstop=4
autocmd FileType go set sts=0
autocmd FileType go set expandtab
autocmd FileType go set smarttab
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType html set sw=2
autocmd FileType c set sw=2
autocmd FileType c set ts=2
autocmd FileType c set sts=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def-tab)


" Vim-Go related Settings
let g:go_errcheck_bin="/Users/vinitkumar/go/bin/errcheck"
let g:go_golint_bin="/Users/vinitkumar/go/bin/golint"
let g:go_fmt_autosave = 1
let g:github_upstream_issues = 1
setlocal omnifunc=go#complete#Complete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
     return neocomplete#close_popup() . "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

"Nerdtree
nmap <C-u> :NERDTreeToggle<CR>
nmap <C-c> :NERDTreeCWD<CR>
let NERDTreeIgnore = ['\.pyc$']

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

