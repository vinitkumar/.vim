" =============================================================================
" .vimrc - optimised for speed
" Backup of previous config: ~/.vimrc.backup.<timestamp>
" =============================================================================

" --- Bootstrap & core perf knobs (set before plugins) -----------------------
set nocompatible
set encoding=UTF-8
scriptencoding utf-8

" Faster startup: skip stuff we never use
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_matchparen        = 1   " we don't need it; saves cycles
let g:netrw_fastbrowse         = 2
let g:python_recommended_style = 0
let g:python3_host_skip_check  = 1   " coc bootstrap nicety

" --- Plugins ----------------------------------------------------------------
call plug#begin('~/.vim/plugged')
  " Lazy-load anything we can: kills 30-40% of startup time
  Plug 'tpope/vim-commentary',  { 'on': ['Commentary', '<Plug>Commentary',
                                       \  '<Plug>CommentaryLine'] }
  Plug 'junegunn/fzf',          { 'do': { -> fzf#install() }, 'on': ['Files', 'Buffers', 'Rg', 'GFiles', 'History'] }
  Plug 'junegunn/fzf.vim',      { 'on': ['Files', 'Buffers', 'Rg', 'GFiles', 'History'] }
  Plug 'tpope/vim-fugitive',    { 'on': ['G', 'Git', 'Gdiff', 'Gblame', 'Gstatus', 'Gwrite', 'Glog'] }
  Plug 'vimwiki/vimwiki',       { 'for': 'vimwiki', 'on': ['VimwikiIndex', 'VimwikiUISelect', 'VimwikiDiaryIndex', 'VimwikiMakeDiaryNote'] }

  " Completion: must load eagerly to register handlers
  Plug 'neoclide/coc.nvim',     { 'branch': 'master' }

  " Colors (load eagerly; colorscheme is set later)
  Plug 'vinitkumar/oscura-vim'
  Plug 'vinitkumar/monokai-pro-vim'
  " Note: dropped 'gthelding/monokai-pro.nvim' (Neovim/Lua only, broken in Vim)
call plug#end()

" --- Editor behaviour -------------------------------------------------------
syntax enable
filetype plugin indent on

set hidden
set exrc
set secure
set mouse=a
set ttyfast
set lazyredraw
set updatetime=300
set timeoutlen=500
set ttimeoutlen=10
set history=10000
set synmaxcol=200
set regexpengine=0
set redrawtime=1500

set backspace=indent,eol,start
set termguicolors
set cursorline
set expandtab
set shiftwidth=4
set softtabstop=4
set ignorecase
set smartcase
set incsearch
set hlsearch
set laststatus=2
set ruler
set showcmd
set showmode
set showtabline=2
set number
set signcolumn=yes
set noautochdir
set switchbuf=useopen
set virtualedit=all
set wildmenu
set wildmode=longest,list
set wildoptions=pum
set scrolloff=20
set guioptions-=a
set guifont=JetBrains\ Mono:h15

" no swap / no backup, ever
set nobackup
set nowritebackup
set noswapfile
set noundofile

" listchars + colorcolumn
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set colorcolumn=120

" Clipboard: rely on system clipboard
set clipboard=unnamed

" Fix kitty/ghostty BCE
let &t_ut=''

" --- Per-host overrides -----------------------------------------------------
let s:hostfile = expand('$HOME/.vim/' . substitute(hostname(), '\.lan$', '', '') . '.vim')
if filereadable(s:hostfile)
  execute 'source ' . fnameescape(s:hostfile)
endif

" --- Colourscheme (cache OS appearance, do NOT shell out per BufEnter) ------
" The old config ran `defaults read -g AppleInterfaceStyle` on every BufEnter
" and FocusGained. That's a fork+exec hot-loop. We cache it and refresh only
" on FocusGained, debounced via a flag.
let g:vimrc_appearance_cache = ''
function! s:DetectAppearance() abort
  " Returns 'dark' or 'light'. Only shells out if cache is empty.
  if g:vimrc_appearance_cache !=# ''
    return g:vimrc_appearance_cache
  endif
  silent let l:out = system('defaults read -g AppleInterfaceStyle 2>/dev/null')
  let g:vimrc_appearance_cache = (l:out =~? '^Dark') ? 'dark' : 'light'
  return g:vimrc_appearance_cache
endfunction

function! ChangeBackground() abort
  let l:mode = s:DetectAppearance()
  if l:mode ==# 'dark'
    set background=dark
  else
    set background=light
    set diffopt+=inline:char
  endif
  silent! colorscheme lanciabones
  highlight LineNr      ctermbg=NONE guibg=NONE
  highlight OverLength  ctermbg=red  ctermfg=white
endfunction

" Refresh appearance only when window regains focus (cheap, debounced)
augroup vimrc_appearance
  autocmd!
  autocmd FocusGained * let g:vimrc_appearance_cache = '' | call ChangeBackground()
augroup END

call ChangeBackground()

" Highlight overlong lines (set once, no per-buffer match cost)
augroup vimrc_overlength
  autocmd!
  autocmd BufWinEnter * match OverLength /\%120v.\+/
augroup END

" --- Statusline (Antirez-style) --------------------------------------------
hi User1 ctermfg=green  ctermbg=black guifg=#9ece6a guibg=#1a1b26
hi User2 ctermfg=yellow ctermbg=black guifg=#e0af68 guibg=#1a1b26
hi User3 ctermfg=red    ctermbg=black guifg=#f7768e guibg=#1a1b26
hi User4 ctermfg=blue   ctermbg=black guifg=#7aa2f7 guibg=#1a1b26
hi User5 ctermfg=white  ctermbg=black guifg=#c0caf5 guibg=#1a1b26

set statusline=
set statusline+=%1*\ %n\ %*               " buffer number
set statusline+=%5*%{&ff}%*               " file format
set statusline+=%3*%y%*                   " file type
set statusline+=%4*\ %<%F%*               " full path
set statusline+=%2*%m%*                   " modified
set statusline+=%{coc#status()}           " coc status
set statusline+=%1*%=%5l%*                " current line
set statusline+=%2*/%L%*                  " total
set statusline+=%1*%4v\ %*                " virtual col
set statusline+=%2*0x%04B\ %*             " char under cursor

" --- Filetype tweaks (single augroup, autocmd! clears on re-source) ---------
augroup vimrc_filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.md  setlocal filetype=markdown shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.yaml,*.yml setlocal filetype=yaml

  " Spell + wrap for prose
  autocmd BufReadPost,BufNewFile *.md,*.txt,*.adoc,COMMIT_EDITMSG
        \ setlocal wrap linebreak nolist spell spelllang=en_us complete+=kspell
  autocmd FileType gitcommit setlocal spell textwidth=72

  " 2-space families
  autocmd FileType javascript,typescript,typescript.tsx,tsx,jsx,json,c,html,htmldjango,yaml
        \ setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

  " Vimwiki diary template
  autocmd BufNewFile ~/vimwiki/diary/*.wiki
        \ silent 0r !~/.vim/bin/generate-vimwiki-diary-template '%'

  " Restore last cursor position
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \ | execute "normal! g`\"" | endif
augroup END

" --- Auto-reload buffers when file changes on disk --------------------------
augroup vimrc_autoread
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
  autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None
augroup END

" --- Strip trailing whitespace on save --------------------------------------
function! s:StripTrailingWhitespace() abort
  if &binary || &filetype ==# 'diff' | return | endif
  let l:save = winsaveview()
  if &filetype ==# 'mail'
    keeppatterns %s/\(^--\)\@<!\s\+$//e
  else
    keeppatterns %s/\s\+$//e
  endif
  call winrestview(l:save)
endfunction
augroup vimrc_strip_ws
  autocmd!
  autocmd BufWritePre * call s:StripTrailingWhitespace()
augroup END

" =============================================================================
" Mappings
" =============================================================================
let mapleader = ','

" ; -> :  (saves a shift)
nnoremap ; :

" Visual indent keeps selection
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Window navigation (this is the FIX for the broken Lua-syntax mappings)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Leader splits / tabs
nnoremap <Leader>h :<C-u>split<CR>
nnoremap <Leader>v :<C-u>vsplit<CR>
nnoremap <Leader>t :<C-u>tabnew<CR>
nnoremap <Leader>z :<C-u>Goyo<CR>

" Save fast
nnoremap <Leader>w :w<CR>

" Wrapped-line movement
nnoremap j gj
nnoremap k gk

" Shell-style HOME/END in insert mode
inoremap <C-e> <End>
inoremap <C-a> <Home>

" Jump to top/bottom (kept; user preference)
nnoremap <CR> G
nnoremap <BS> gg

" System clipboard yank/paste/delete (single canonical block, no dupes)
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" fzf / files
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g> :Rg<CR>
" NOTE: <C-o> is intentionally NOT remapped (preserves Vim's jump-back)

" Misc leader actions
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>d  :Dispatch make test<CR>
nnoremap <Leader>dt i<C-r>=strftime('%c')<CR><Esc>

" =============================================================================
" coc.nvim
" =============================================================================
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_backspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()

function! s:check_backspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Diagnostics navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <C-e> :CocDiagnostics<CR>

" GoTo (single canonical set)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Hover
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation() abort
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Cursor symbol highlighting (cheap, idle-time)
augroup vimrc_coc
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

" Refactor / format / codeaction
nmap <Leader>rn <Plug>(coc-rename)
xmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>f  <Plug>(coc-format-selected)
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>ac <Plug>(coc-codeaction)
nmap <Leader>qf <Plug>(coc-fix-current)
nmap <Leader>cl <Plug>(coc-codelens-action)

" Text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Selection ranges (note: <C-s> often eaten by terminal flow control;
" run `stty -ixon` if it doesn't fire)
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
command! -nargs=0 OR     :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" CocList
nnoremap <silent><nowait> <Space>a :<C-u>CocList diagnostics<CR>
nnoremap <silent><nowait> <Space>e :<C-u>CocList extensions<CR>
nnoremap <silent><nowait> <Space>c :<C-u>CocList commands<CR>
nnoremap <silent><nowait> <Space>o :<C-u>CocList outline<CR>
nnoremap <silent><nowait> <Space>s :<C-u>CocList -I symbols<CR>
nnoremap <silent><nowait> <Space>j :<C-u>CocNext<CR>
nnoremap <silent><nowait> <Space>k :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <Space>p :<C-u>CocListResume<CR>
