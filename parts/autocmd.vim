autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType json setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType c setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType php setlocal expandtab sw=2 ts=2 sts=2
autocmd BufNewFile,BufReadPost *.jade set filetype=pug
autocmd FileType html setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType less setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType htmldjango setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType css setlocal expandtab sw=2 ts=2 sts=2
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
" Don't syntax highlight markdown because it's often wrong
autocmd! FileType mkd setlocal syn=off
autocmd! BufNewFile,BufRead *.md setlocal ft=
" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Two-space indents in TypeScript
autocmd! FileType typescript set sw=2 sts=2 expandtab
" Automatically write after inactivity in TypeScript
autocmd FileType typescript autocmd CursorHold <buffer> :silent :wa

" Somehow, loading TypeScript .tsx files sometimes invokes the XML file
" type, which messes up the indentation. Force XML indentation to 2 so at
" least it doesn't change TypeScript indentation at random.
autocmd! FileType xml set sw=2 sts=2 expandtab

" Two-space indents in json
autocmd! FileType json set sw=2 sts=2 expandtab

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


" Auto save when focus is lost, so that not code is lost
au FocusLost * :wa

" Python related config
" Run black when on saving a python file
"autocmd BufWritePre *.py execute ':Black'
autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab fileformat=unix comments=:#\:,:#
" Two-space indents in TypeScript
autocmd! FileType typescript set sw=2 sts=2 expandtab
" Automatically write after inactivity in TypeScript
autocmd FileType typescript autocmd CursorHold <buffer> :silent :wa

" Somehow, loading TypeScript .tsx files sometimes invokes the XML file
" type, which messes up the indentation. Force XML indentation to 2 so at
" least it doesn't change TypeScript indentation at random.
autocmd! FileType xml set sw=2 sts=2 expandtab

