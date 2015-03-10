set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'kien/ctrlp.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'sjl/badwolf'
Plugin 'tpope/vim-sensible'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'vinitkumar/vim-tomorrow-theme'
Plugin 'mrtazz/DoxygenToolkit.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'Ack.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

""""""""""""""""""""""""""""""
" vim-powerline symbols
let g:airline_theme             = 'badwolf'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

" vim-powerline symbols
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_branch_prefix     = '⭠'
let g:airline_readonly_symbol   = '⭤'
let g:airline_linecolumn_prefix = '⭡'
"

"tagbar related settings
set tags=./tags;,~/.vimtags
+" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" Disable the scrollbars
set guioptions-=r
set guioptions-=L



" General 

set nu
set numberwidth=3
set mouse=a
syntax on
set autoread

set background=dark
colorscheme base16-google 
let g:colors_name="base16-google"

" disable ugly gtk stuff
set guioptions-=m
set guioptions-=M
set guioptions-=T
set guioptions-=e
" Whitespace
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }

" Formatting {

set autoindent " Copy indent from last line when starting new line.
set colorcolumn=80 " mark col 80
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces
set ignorecase
set smartcase
set foldcolumn=4 " Column to show folds
set foldenable
set foldlevel=2
set foldlevelstart=2 " Sets `foldlevel` when editing a new buffer
set foldmethod=indent " Markers are used to specify folds.
set foldnestmax=3 " Set max fold nesting level
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set magic " Enable extended regexes.
set nocompatible " Make vim more useful
set noerrorbells " Disable error bells.
set nostartofline
set noshowmode
" set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shiftwidth=2 " The # of spaces for indenting.
set shortmess=I " Don't show the intro message when starting vim.
set showmode " Show the current mode.
set showtabline=2 " Always show tab bar.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set tabstop=2
set softtabstop=2 " Tab key results in 2 spaces
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.

set wrap
set textwidth=79
set formatoptions=qrn1


" We do utf-8
scriptencoding utf-8
set encoding=utf-8

" Tagbar related settings
nmap <F8> :TagbarToggle<CR>


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

" CtrlP related settings
let g:ctrlp_working_path_mode = ''
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc,*.pyc
set wildmenu


" Gist related settings

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1



" Configuration
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="-------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Vinit Kumar"


"Nerdtree
nmap <C-u> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
