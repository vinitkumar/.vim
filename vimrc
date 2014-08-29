" Environment {

  " Identify platform {
    silent function! OSX()
      return has('macunix')
    endfunction
    silent function! LINUX()
      return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
      return  (has('win16') || has('win32') || has('win64'))
    endfunction
  " }

  " Basics {
    set nocompatible        " Must be first line
    if !WINDOWS()
      set shell=/bin/sh
    endif
  " }
" }

" Use before config if available {
    if filereadable(expand("~/.vimrc.before"))
      source ~/.vimrc.before
    endif
" }

" Use after config if available {
    if filereadable(expand("~/.vimrc.after"))
      source ~/.vimrc.after
    endif
"}


" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
      source ~/.vimrc.bundles
    endif
" }


""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
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


" CtrlP
  " Open ctrlp with cmd+p
  let g:ctrlp_map = '<D-p>'

  " Comment lines with cmd+/
  map <D-/> :TComment<cr>
  vmap <D-/> :TComment<cr>gv

  " Indent lines with cmd+[ and cmd+]
  nmap <D-]> >>
  nmap <D-[> <<
  vmap <D-[> <gv
  vmap <D-]> >gv

  "Open sidebar with cmd+k
  map <D-k> :NERDTreeTabsToggle<CR>

  " This mapping makes Ctrl-Tab switch between tabs.
  " Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " switch between tabs with cmd+1, cmd+2,..."
  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt

  " until we have default MacVim shortcuts this is the only way to use it in
  " insert mode
  imap <D-1> <esc>1gt
  imap <D-2> <esc>2gt
  imap <D-3> <esc>3gt
  imap <D-4> <esc>4gt
  imap <D-5> <esc>5gt
  imap <D-6> <esc>6gt
  imap <D-7> <esc>7gt
  imap <D-8> <esc>8gt
  imap <D-9> <esc>9gt

" General {

  set background=light         " Assume a dark background
  " if !has('gui')
    "set term=$TERM          " Make arrow and other keys work
  " endif
  filetype plugin indent on   " Automatically detect file types.
  syntax on                   " Syntax highlighting
  set mouse=a                 " Automatically enable mouse usage
  set mousehide               " Hide the mouse cursor while typing
  scriptencoding utf-8

  if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
      set clipboard=unnamedplus
    else         " On mac and Windows, use * register for copy-paste
      set clipboard=unnamed
    endif
  endif

  " Most prefer to automatically switch to the current file directory when
  " a new buffer is opened; to prevent this behavior, add the following to
  " your .vimrc.before.local file:
  "   let g:spf13_no_autochdir = 1
  if !exists('g:spf13_no_autochdir')
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " Always switch to the current file directory
  endif

  set autowrite                       " Automatically write a file when leaving a modified buffer
  set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
  set virtualedit=onemore             " Allow for cursor beyond last character
  set history=1000                    " Store a ton of history (default is 20)
  set spell                           " Spell checking on
  set hidden                          " Allow buffer switching without saving

  " Instead of reverting the cursor to the last position in the buffer, we
  " set it to the first line when editing a git commit message
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

  " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
  " Restore cursor to file position in previous editing session
  " To disable this, add the following to your .vimrc.before.local file:
  "   let g:spf13_no_restore_cursor = 1
  if !exists('g:spf13_no_restore_cursor')
    function! ResCur()
      if line("'\"") <= line("$")
        normal! g`"
        return 1
      endif
    endfunction

    augroup resCur
      autocmd!
      autocmd BufWinEnter * call ResCur()
    augroup END
  endif

  " Setting up the directories {
  set backup                  " Backups are nice ...
  if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  endif

  " To disable views add the following to your .vimrc.before.local file:
  "   let g:spf13_no_views = 1
  if !exists('g:spf13_no_views')
    " Add exclusions to mkview and loadview
    " eg: *.*, svn-commit.tmp
    let g:skipview_files = [
      \ '\[example pattern\]'
      \ ]
    endif
  " }

" }


" Vim UI {
  let g:Powerline_symbols = 'compatible'
  set encoding=utf-8
  if filereadable(expand("~/.vim/bundle/badwolf/colors/badwolf.vim"))
    let g:badwolf_termcolors=256
    let g:badwolf_termtrans=1
    let g:badwolf_contrast="normal"
    let g:badwolf_visibility="normal"
    color badwolf             " Load a colorscheme
  endif

  set tabpagemax=15               " Only show 15 tabs
  set showmode                    " Display the current mode

  set cursorline                  " Highlight current line

  highlight clear SignColumn      " SignColumn should match background
  highlight clear LineNr          " Current line number row will have same background color in relative mode
  let g:CSApprox_hook_post = ['hi clear SignColumn']
  "highlight clear CursorLineNr    " Remove highlight color from current line number

  if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                  " Selected characters/lines in visual mode
  endif

  if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif

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
  " set foldcolumn=4 " Column to show folds
  " set foldenable
  " set foldlevel=2
  " set foldlevelstart=2 " Sets `foldlevel` when editing a new buffer
  " set foldmethod=indent " Markers are used to specify folds.
  " set foldnestmax=3 " Set max fold nesting level
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


" Key (re)Mappings {

  " The default leader is '\', but many people prefer ',' as it's in a standard
  " location. To override this behavior and set it back to '\' (or any other
  " character) add the following to your .vimrc.before.local file:
  "   let g:spf13_leader='\'
  if !exists('g:spf13_leader')
      let mapleader = ','
  else
      let mapleader=g:spf13_leader
  endif
  if !exists('g:spf13_localleader')
      let maplocalleader = '_'
  else
      let maplocalleader=g:spf13_localleader
  endif

  " Easier moving in tabs and windows
  " The lines conflict with the default digraph mapping of <C-K>
  " If you prefer that functionality, add the following to your
  " .vimrc.before.local file:
  "   let g:spf13_no_easyWindows = 1
  if !exists('g:spf13_no_easyWindows')
      map <C-J> <C-W>j<C-W>_
      map <C-K> <C-W>k<C-W>_
      map <C-L> <C-W>l<C-W>_
      map <C-H> <C-W>h<C-W>_
  endif

  " Wrapped lines goes down/up to next row, rather than next line in file.
  noremap j gj
  noremap k gk

  " End/Start of line motion keys act relative to row/wrap width in the
  " presence of `:set wrap`, and relative to line for `:set nowrap`.
  " Default vim behaviour is to act relative to text line in both cases
  " If you prefer the default behaviour, add the following to your
  " .vimrc.before.local file:
  "   let g:spf13_no_wrapRelMotion = 1
  if !exists('g:spf13_no_wrapRelMotion')
    " Same for 0, home, end, etc
    function! WrapRelativeMotion(key, ...)
      let vis_sel=""
      if a:0
        let vis_sel="gv"
      endif
      if &wrap
        execute "normal!" vis_sel . "g" . a:key
      else
        execute "normal!" vis_sel . a:key
      endif
    endfunction

    " Map g* keys in Normal, Operator-pending, and Visual+select
    noremap $ :call WrapRelativeMotion("$")<CR>
    noremap <End> :call WrapRelativeMotion("$")<CR>
    noremap 0 :call WrapRelativeMotion("0")<CR>
    noremap <Home> :call WrapRelativeMotion("0")<CR>
    noremap ^ :call WrapRelativeMotion("^")<CR>
    " Overwrite the operator pending $/<End> mappings from above
    " to force inclusive motion with :execute normal!
    onoremap $ v:call WrapRelativeMotion("$")<CR>
    onoremap <End> v:call WrapRelativeMotion("$")<CR>
    " Overwrite the Visual+select mode mappings from above
    " to ensure the correct vis_sel flag is passed to function
    vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
    vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
    vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
    vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
    vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>
  endif

  " The following two lines conflict with moving to top and
  " bottom of the screen
  " If you prefer that functionality, add the following to your
  " .vimrc.before.local file:
  "   let g:spf13_no_fastTabs = 1
  if !exists('g:spf13_no_fastTabs')
    map <S-H> gT
    map <S-L> gt
  endif

  " Stupid shift key fixes
  if !exists('g:spf13_no_keyfixes')
    if has("user_commands")
      command! -bang -nargs=* -complete=file E e<bang> <args>
      command! -bang -nargs=* -complete=file W w<bang> <args>
      command! -bang -nargs=* -complete=file Wq wq<bang> <args>
      command! -bang -nargs=* -complete=file WQ wq<bang> <args>
      command! -bang Wa wa<bang>
      command! -bang WA wa<bang>
      command! -bang Q q<bang>
      command! -bang QA qa<bang>
      command! -bang Qa qa<bang>
    endif

    cmap Tabe tabe
  endif

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Code folding options
  nmap <leader>f0 :set foldlevel=0<CR>
  nmap <leader>f1 :set foldlevel=1<CR>
  nmap <leader>f2 :set foldlevel=2<CR>
  nmap <leader>f3 :set foldlevel=3<CR>
  nmap <leader>f4 :set foldlevel=4<CR>
  nmap <leader>f5 :set foldlevel=5<CR>
  nmap <leader>f6 :set foldlevel=6<CR>
  nmap <leader>f7 :set foldlevel=7<CR>
  nmap <leader>f8 :set foldlevel=8<CR>
  nmap <leader>f9 :set foldlevel=9<CR>

  " Most prefer to toggle search highlighting rather than clear the current
  " search results. To clear search highlighting rather than toggle it on
  " and off, add the following to your .vimrc.before.local file:
  "   let g:spf13_clear_search_highlight = 1
  if exists('g:spf13_clear_search_highlight')
      nmap <silent> <leader>/ :nohlsearch<CR>
  else
      nmap <silent> <leader>/ :set invhlsearch<CR>
  endif


  " Find merge conflict markers
  map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

  " Shortcuts
  " Change Working Directory to that of the current file
  cmap cwd lcd %:p:h
  cmap cd. lcd %:p:h

  " Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  " Allow using the repeat operator with a visual selection (!)
  " http://stackoverflow.com/a/8064607/127816
  vnoremap . :normal .<CR>

  " For when you forget to sudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null

  " Some helpers to edit mode
  " http://vimcasts.org/e/14
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  map <leader>ew :e %%
  map <leader>es :sp %%
  map <leader>ev :vsp %%
  map <leader>et :tabe %%

  " Adjust viewports to the same size
  map <Leader>= <C-w>=

  " Map <Leader>ff to display all lines with keyword under cursor
  " and ask which one to jump to
  nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

  " Easier horizontal scrolling
  map zl zL
  map zh zH

  " FIXME: Revert this f70be548
  " fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
  map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" }

" Plugins {

  " PIV {
    let g:DisableAutoPHPFolding = 0
    let g:PIVAutoClose = 0
  " }

  " Misc {
    let g:NERDShutUp=1
    let b:match_ignorecase = 1
  " }

  " OmniComplete {
    " To disable omni complete, add the following to your .vimrc.before.local file:
    "   let g:spf13_no_omni_complete = 1
    if !exists('g:spf13_no_omni_complete')
      if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
            \if &omnifunc == "" |
            \setlocal omnifunc=syntaxcomplete#Complete |
            \endif
        endif

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " Some convenient mappings
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " Automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,preview,longest
      endif
  " }

    " Ctags {
      set tags=./tags;/,~/.vimtags

      " Make tags placed in .git/tags file available in all levels of a repository
      let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
      if gitroot != ''
          let &tags = &tags . ',' . gitroot . '/.git/tags'
      endif
    " }

    " AutoCloseTag {
      " Make it so AutoCloseTag works for xml and xhtml files as well
      au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
      nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " SnipMate {
      " Setting the author var
      " If forking, please overwrite in your .vimrc.local file
      let g:snips_author = 'Steve Francia <steve.francia@gmail.com>'
    " }

    " NerdTree {
      map <C-e> <plug>NERDTreeTabsToggle<CR>
      map <leader>e :NERDTreeFind<CR>
      nmap <leader>nt :NERDTreeFind<CR>

      let NERDTreeShowBookmarks=1
      let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
      let NERDTreeChDirMode=0
      let NERDTreeQuitOnOpen=1
      let NERDTreeMouseMode=2
      let NERDTreeShowHidden=1
      let NERDTreeKeepTreeInNewTab=1
      let g:nerdtree_tabs_open_on_gui_startup=0
    " }

    " Tabularize {
      nmap <Leader>a& :Tabularize /&<CR>
      vmap <Leader>a& :Tabularize /&<CR>
      nmap <Leader>a= :Tabularize /=<CR>
      vmap <Leader>a= :Tabularize /=<CR>
      nmap <Leader>a: :Tabularize /:<CR>
      vmap <Leader>a: :Tabularize /:<CR>
      nmap <Leader>a:: :Tabularize /:\zs<CR>
      vmap <Leader>a:: :Tabularize /:\zs<CR>
      nmap <Leader>a, :Tabularize /,<CR>
      vmap <Leader>a, :Tabularize /,<CR>
      nmap <Leader>a,, :Tabularize /,\zs<CR>
      vmap <Leader>a,, :Tabularize /,\zs<CR>
      nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
      vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    " }

    " Session List {
      set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
      nmap <leader>sl :SessionList<CR>
      nmap <leader>ss :SessionSave<CR>
      nmap <leader>sc :SessionClose<CR>
    " }

    " JSON {
      nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    " }

    " PyMode {
      let g:pymode_lint_checker = "pyflakes, pep8"
      let g:pymode_utils_whitespaces = 0
      let g:pymode_options = 0
  " }


  " PythonMode {
      " Disable if python support not present
      if !has('python')
          let g:pymode = 0
      endif
  " }

  " Fugitive {
      nnoremap <silent> <leader>gs :Gstatus<CR>
      nnoremap <silent> <leader>gd :Gdiff<CR>
      nnoremap <silent> <leader>gc :Gcommit<CR>
      nnoremap <silent> <leader>gb :Gblame<CR>
      nnoremap <silent> <leader>gl :Glog<CR>
      nnoremap <silent> <leader>gp :Git push<CR>
      nnoremap <silent> <leader>gr :Gread<CR>
      nnoremap <silent> <leader>gw :Gwrite<CR>
      nnoremap <silent> <leader>ge :Gedit<CR>
      " Mnemonic _i_nteractive
      nnoremap <silent> <leader>gi :Git add -p %<CR>
      nnoremap <silent> <leader>gg :SignifyToggle<CR>
  "}

  " YouCompleteMe {
      if count(g:spf13_bundle_groups, 'youcompleteme')
          let g:acp_enableAtStartup = 0

          " enable completion from tags
          let g:ycm_collect_identifiers_from_tags_files = 1

          " remap Ultisnips for compatibility for YCM
          let g:UltiSnipsExpandTrigger = '<C-j>'
          let g:UltiSnipsJumpForwardTrigger = '<C-j>'
          let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

          " Enable omni completion.
          autocmd VimEnter * NERDTree
          autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
          autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
          autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
          autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
          autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
          autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
          autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

          " Haskell post write lint and check with ghcmod
          " $ `cabal install ghcmod` if missing and ensure
          " ~/.cabal/bin is in your $PATH.
          if !executable("ghcmod")
              autocmd BufWritePost *.hs GhcModCheckAndLintAsync
          endif

          " For snippet_complete marker.
          if !exists("g:spf13_no_conceal")
              if has('conceal')
                  set conceallevel=2 concealcursor=i
              endif
          endif

          " Disable the neosnippet preview candidate window
          " When enabled, there can be too much visual noise
          " especially when splits are used.
          set completeopt-=preview
      endif
  " }


" GUI Settings {

  " GVIM- (here instead of .gvimrc)
  if has('gui_running')
    set guioptions-=T           " Remove the toolbar
    set lines=40                " 40 lines of text instead of 24
    if !exists("g:spf13_no_big_font")
        if LINUX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif OSX() && has("gui_running")
            set guifont=Monaco:h12,Consolas:h14
            set guioptions=egmrt
        elseif WINDOWS() && has("gui_running")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
    endif
  else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi       " Make arrow and other keys work
  endif

" }

" Functions {

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }

    " Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }


  " Strip whitespace {
  function! StripTrailingWhitespace()
      " Preparation: save last search, and cursor position.
      let _s=@/
      let l = line(".")
      let c = col(".")
      " do the business:
      %s/\s\+$//e
      " clean up: restore previous search history, and cursor position
      let @/=_s
      call cursor(l, c)
  endfunction
  " }

  " Shell command {
  function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
  endfunction

  command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
  " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
  " }

" }

" Use fork vimrc if available {
    if filereadable(expand("~/.vimrc.fork"))
      source ~/.vimrc.fork
    endif
" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
      source ~/.vimrc.local
    endif
" }

" Use local gvimrc if available and gui is running {
    if has('gui_running')
      if filereadable(expand("~/.gvimrc.local"))
        source ~/.gvimrc.local
      endif
    endif
" }

let g:instant_markdown_autostart = 1

" Markdown
autocmd! BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:> ft=markdown
autocmd! BufRead *.md set ai formatoptions=tcroqn2 comments=n:> ft=markdown
autocmd! BufRead *.mdown set ai formatoptions=tcroqn2 comments=n:> ft=markdown
autocmd! BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> ft=markdown

" CSS3
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.css set ft=css syntax=css

" HTML5
au BufRead,BufNewFile *.html set ft=html syntax=html
au BufRead,BufNewFile *.hbs set ft=html syntax=html
au BufRead,BufNewFile *.mustache set ft=html syntax=html
au BufRead,BufNewFile *.haml set ft=haml

au BufRead,BufNewFile *.js set ft=javascript syntax=javascript
au BufRead,BufNewfile *.rb set ft=ruby syntax=ruby

autocmd! BufWritePre * :%s/\s\+$//e
autocmd FileType mail :nmap <F8> :w<CR>:!aspell -e -c %<CR>:e<CR>


