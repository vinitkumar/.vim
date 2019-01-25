autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType json setlocal expandtab sw=2 ts=2 sts=2
autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab fileformat=unix comments=:#\:,:#
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

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif



