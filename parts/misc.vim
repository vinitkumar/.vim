  " Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/


if &history < 1000
  set history=1000      " Number of lines in command history.
endif
if &tabpagemax < 50
  set tabpagemax=50     " Maximum tab pages.
endif

if &undolevels < 200
  set undolevels=200    " Number of undo levels.
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


