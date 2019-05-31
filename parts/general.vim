" General {
filetype plugin indent on
set termencoding=utf-8
set encoding=utf-8
set nocompatible
set backspace=indent,eol,start      " Allow backspace over everything in insert mode.
set mousemodel=popup
set noswapfile
set t_Co=256
set smarttab
set lazyredraw
set secure
set cursorline
set showtabline=2
set switchbuf=useopen
set cmdheight=1
set exrc
set ttyfast
set noautoindent        " I indent my code myself.
set nocindent           " I indent my code myself.
set omnifunc=syntaxcomplete#Complete
set nrformats-=octal
:set timeout timeoutlen=1000 ttimeoutlen=50
set hlsearch            " Highlight search results.
set ignorecase smartcase          " Make searching case insensitive
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set hidden              " hide buffers instead of closing them this
                        "    means that the current buffer can be put
                        "    to background without being written; and
                        "    that marks and undo history are preserved
set showcmd             " Show (partial) command in status line.
set colorcolumn=100
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set nonumber              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
map <D-d> yyp
set noerrorbells        " No beeps.
set modeline            " Enable modeline.
"set esckeys             " Cursor keys in insert mode.
set linespace=3         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set list
set listchars=tab:›\ ,eol:¬,trail:⋅
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
set autoread            " If file updates, load automatically.
" Reload vim whenever the config files changes

set display+=lastline
set nostartofline       " Do not jump to first character with page commands.


set wildmenu
set wildchar=<TAB>
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=longest:list
set pastetoggle=<F2>

if (has("termguicolors"))
   set termguicolors
endif

let g:VimSplitBalancerMaxWidth=200
"disable arrow keys in vim
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
set noeb vb t_vb=
