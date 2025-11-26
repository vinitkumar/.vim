call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'master'}
  Plug 'tpope/vim-fugitive'
  Plug 'vimwiki/vimwiki'
  Plug 'vinitkumar/oscura-vim'
  Plug 'vinitkumar/monokai-pro-vim'
  Plug 'sainnhe/everforest'
call plug#end()

" Tab indentation
vmap <TAB> >gv

" Security and local config
set exrc
set secure

let _hostname = substitute(hostname(), ".lan", "", "")
let _hostfile = expand("$HOME/.vim/"._hostname.".vim")
if _hostfile != "" && filereadable(_hostfile)
  exec "source "._hostfile
endif

" === Core Settings ===
set hidden
set backspace=indent,eol,start
set termguicolors
set cursorline
set nocursorcolumn        " Disable column highlight (faster on large files)
set expandtab
set guioptions-=a
set ignorecase            " Ignore case in search
set incsearch             " Incremental search
set laststatus=2          " Always show statusline
set lazyredraw            " Don't redraw during macros
set nobackup
set noswapfile
set nowritebackup
set number
set ruler                 " Show cursor position
set shiftwidth=4
set showcmd
set noautochdir
set encoding=UTF-8
set t_Co=256
set showmode              " Show current mode
set showtabline=2
set smartcase             " Case-sensitive if uppercase in pattern
set sts=4
set switchbuf=useopen
set synmaxcol=200
set virtualedit=all
set wildmenu
set wildmode=longest,list
set wildoptions=pum
set history=10000
set signcolumn=yes
set updatetime=300        " Faster CoC diagnostics (default 4000ms)
set timeoutlen=500        " Faster leader key response
normal mz

" Visual guides
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set scrolloff=20
set colorcolumn=120
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%120v.\+/

" === File Type Settings ===
augroup filetypedetect
  autocmd!
  autocmd BufNewFile,BufRead *.md set filetype=markdown sts=4 shiftwidth=4
  autocmd BufReadPost,BufNewFile *.md,*.txt,COMMIT_EDITMSG set wrap linebreak nolist spell spelllang=en_us complete+=kspell
  autocmd BufReadPost,BufNewFile .html,*.txt,*.md,*.adoc set spell spelllang=en_us
  autocmd Filetype gitcommit setlocal spell textwidth=72
  autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType typescript setlocal expandtab sw=2 ts=2 sts=2 updatetime=300
  autocmd FileType tsx setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType jsx setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType json setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType c setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType html setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType htmldjango setlocal expandtab sw=2 ts=2 sts=2
  autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufNewFile ~/vimwiki/diary/*.wiki :silent 0r !~/.vim/bin/generate-vimwiki-diary-template '%'
augroup END

" === Key Mappings ===
let mapleader=","

" FZF and file navigation
nmap <C-p> :Files<CR>
nmap <C-o> :Files<CR>
nmap <C-b> :Buffers<CR>
nmap <C-t> :tabNext<CR>
nmap <C-g> :Grep<CR>

" CoC mappings
nmap <C-e> :CocDiagnostics<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>ev :vsplit $MYVIMRC<CR>
nmap <leader>d :Dispatch make test<CR>
nmap <leader>dt i<C-r>=strftime('%c')<CR>

" Save, copy, paste
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Window navigation (fixed - removed parentheses)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window management
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>z :<C-u>Goyo<CR>
noremap <Leader>t :<C-u>tabnew<CR>

" Navigation
nnoremap j gj
nnoremap k gk
inoremap <C-E> <End>
inoremap <C-A> <Home>

" Colon shortcut
nnoremap ; :

" === Autocommands ===
" Jump to last cursor position
augroup vimrc_cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
augroup END

" Strip trailing whitespace
autocmd BufWritePre * :call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    if &filetype == 'mail'
      %s/\(^--\)\@<!\s\+$//e
    else
      %s/\s\+$//e
    endif
    normal 'yz<Enter>
    normal `z
  endif
endfunction

" Auto-reload when file changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" === Mouse and Clipboard ===
set mouse=a
set clipboard=unnamed

" === Color Scheme ===
" Dynamic theme switching based on macOS appearance
function! ChangeBackground()
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    colorscheme everforest
    set background=dark
    let g:everforest_background = 'soft'
    let g:everforest_better_performance = 1
  else
    colorscheme oscura-dusk-light
    set diffopt+=inline:char
    set background=light
  endif
endfunction

call ChangeBackground()
autocmd FocusGained,BufEnter * call ChangeBackground()

" Fix for kitty terminal
let &t_ut=''

" === CoC Configuration ===
" Tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()

" Diagnostics navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight symbol and references
autocmd CursorHold * silent call CocActionAsync('highlight')

" Renaming and formatting
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Code actions
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>cl <Plug>(coc-codelens-action)

" Text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Selection range
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Commands
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Status line with CoC info
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" CocList mappings
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" === FZF Configuration ===
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" === Custom Statusline ===
" Clean, minimal statusline with colors
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
