call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'master'}
  Plug 'tpope/vim-fugitive'
  Plug 'github/copilot.vim'
  Plug 'vimwiki/vimwiki'
  Plug 'vinitkumar/oscura-vim'
call plug#end()

vmap <TAB> >gv
set exrc
set secure

let _hostname = substitute(hostname(), ".lan", "", "")
let _hostfile = expand("$HOME/.vim/"._hostname.".vim")

if _hostfile != "" && filereadable(_hostfile)
  exec "source "._hostfile
endif

set hidden

set backspace=indent,eol,start
set nocursorline
set termguicolors
set expandtab
set guioptions-=a
set ignorecase          " ignore the case
set incsearch  " incremental search
set laststatus=2        " show the status bar even with one buffer
set lazyredraw
set nobackup
set noswapfile
set noswapfile
set nowritebackup
set number
set ruler               " show cursor position
set shiftwidth=4
set showcmd
set noautochdir
set encoding=UTF-8
set t_Co=256
set showmode            " show the current mode
set showtabline=2
set smartcase           " don't ignore the case if the pattern is uppercase
set sts=4
set switchbuf=useopen
set switchbuf=useopen
set synmaxcol=200
set virtualedit=all
set wildmenu
set wildmode=longest,list
set wildoptions=pum
set history=10000
set signcolumn=yes
normal mz

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set scrolloff=20

" colorcolumn
set colorcolumn=120
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%120v.\+/



" change filetypes for common files
augroup filetypedetect
autocmd BufNewFile,BufRead *.md set filetype=markdown sts=4 shiftwidth=4
autocmd BufReadPost,BufNewFile *.md,*.txt,COMMIT_EDITMSG set wrap linebreak nolist spell spelllang=en_us complete+=kspell
autocmd BufReadPost,BufNewFile .html,*.txt,*.md,*.adoc set spell spelllang=en_us
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType typescript setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType tsx setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType jsx setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType json setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType c setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType html setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType htmldjango setlocal expandtab sw=2 ts=2 sts=2
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript autocmd CursorHold <buffer> :silent :wa
autocmd BufNewFile ~/vimwiki/diary/*.wiki :silent 0r !~/.vim/bin/generate-vimwiki-diary-template '%'
augroup END


" Collection of all the maps
let mapleader=","
nmap <C-p> :Files<CR>
nmap <C-o> :Files<CR>
nmap <C-b> :Buffers<CR>
nmap <C-c> :Commits<CR>
nmap <C-t> :tabNext<CR>
nmap <C-g> :Grep<CR>
nmap <C-e> :CocDiagnostics<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gr <Plug>(coc-references))
nmap <leader>ev :vsplit $MYVIMRC<CR>
nmap <leader>d :Dispatch make test<CR>
nmap <leader>dt :call append('.', strftime('%c'))<CR>
nmap <leader>dt i<C-r>=strftime('%c')<CR>

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

nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>z :<C-u>Goyo<CR>

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

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set t_co=256
set mouse=a

" ChangeBackground changes the background mode based on macOS's `Appearance`
" setting. We also refresh the statusline colors to reflect the new mode.
function! ChangeBackground()
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark  " or dark
    if has('gui_running')
        colorscheme oscura
        " Additional GUI-specific settings
        set guifont=Source\ Code\ Pro:h16
    else
        colorscheme oscura
    endif
  else
    colorscheme rosepine
    set background=light  " for the light version of the theme
  endif
endfunction

" initialize the colorscheme for the first run
call ChangeBackground()

" " change the color scheme if we receive a SigUSR1
" " autocmd SigUSR1 * call ChangeBackground()
autocmd FocusGained,BufEnter * call ChangeBackground()

" fix for kitty in vim
let &t_ut=''

set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'


if $TERM == "xterm-256color"
  set t_Co=256
endif
set clipboard=unnamed
" Yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" Paste from system clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p


" Antirez's vimrc lightline replacement
"
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
