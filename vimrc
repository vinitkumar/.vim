set nocompatible              " be iMproved, required
filetype off                  " required

" cleaner way to add bundles
source ~/bundles.vim

" Airline related settings
let g:airline_theme             = 'badwolf'
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

syntax on

" Theming
set guifont=Monaco:h12
set background=dark
colorscheme badwolf

" Core Settings
set nu "show numbers
set mouse=a "enable numbers
set cursorline "enable cursorline
set t_Co=256
set colorcolumn=100
set guifont=Monaco:h12
set background=dark
colorscheme badwolf
let g:solarized_termcolors=256
set antialias
set backspace=2  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set scrolloff=999               " Minimum lines to keep above and below cursor
set list
set listchars=tab:›\ ,eol:¬,trail:⋅ "Set the characters for the invisibles
set splitbelow
set splitright
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=100 " Increase history from 20 default to 1000
set laststatus=2 " Always show status line
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

let mapleader = "\<Space>"
nmap <silent> <leader>vimrc :e ~/.vimrc<CR>
map <leader>y "*y
map <leader>p "*p
cmap w!! %!sudo tee > /dev/null %
autocmd BufWritePre * :%s/\s\+$//e
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
  autocmd FileType ruby,python,javascript,c,cpp,objc,rst let &colorcolumn="100"
endif


"Nerdtree
"nmap <C-u> :NERDTreeToggle<CR>
"let NERDTreeIgnore = ['\.pyc$']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Spell check always on
set spell spelllang=en_us
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType go set sw=4
autocmd FileType go set tabstop=4
autocmd FileType go set sts=0
autocmd FileType go set expandtab
autocmd FileType go set smarttab
autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType json setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType python setlocal expandtab sw=4 ts=4 sts=4
autocmd FileType c setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType html setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType less setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType htmldjango setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType css setlocal expandtab sw=2 ts=2 sts=2
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
let g:go_disable_autoinstall = 0


"NeoComplete related magic
setlocal omnifunc=go#complete#Complete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

function! s:my_cr_function()
     return neocomplete#close_popup() . "\<CR>"
endfunction

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_match_window_bottom = 0		" show the match window at the top of the screen
let g:ctrlp_by_filename = 1
let g:ctrlp_max_height = 10				" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already


"Nerdtree
nmap <C-u> :NERDTreeToggle<CR>
nmap <C-c> :NERDTreeCWD<CR>
nmap <C-s> :SyntasticCheck<CR>
let NERDTreeIgnore = ['\.pyc$']

let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = "--no-eslintrc --config ~/.eslintrc.js"
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

