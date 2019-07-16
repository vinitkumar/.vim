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

let g:black_virtualenv = '/Users/advik/.virtualenvs/black'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=dark
  "if !has('gui_running')
  "  let g:solarized_termcolors=256
  "endif
  colors grb256
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>


" " Random color schemes!
" function RandomColorScheme()
"   let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
"   exe 'so ' . mycolors[localtime() % len(mycolors)]
"   unlet mycolors
" endfunction
" :command NewColor call RandomColorScheme()

" call RandomColorScheme()
" " :colorscheme base16-materia

" nnoremap ,, :C<CR>:colorscheme<CR>
