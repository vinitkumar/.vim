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

" Ale related settings" Make vim faster in iterm/Terminal.app
let g:ale_python_flake8_args="--ignore=E501"

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'swift': ['swiftlint'],
\   'python': ['mypy'],
\   'typescript': ['tslint'],
\}


let g:ale_fixers = { 'python': ['black']}

"let g:ale_python_pylint_args="--load-plugins pylint_django"
let g:ale_set_signs = 0
let g:ale_lint_delay = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 0

"let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

set rtp+=/usr/local/opt/fzf

" " Customize fzf colors to match your color scheme
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


" for neovim
let test#neovim#term_position = "topleft"
" or for Vim8
let test#vim#term_position = "belowright"
