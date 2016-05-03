" Vim colorscheme -- PyChimp 
"
" Crated specifically for Python coding ! (For other languages, I do suggest that 
" you find other colorschemes, there are loads !)
"
" Author: Pratheek <pratheek.i@gmail.com>
"
" Note: This theme uses ideas from Python IDLE, (and has some similarities) from Molokai theme
" created by Thomas Restrepo
" <http://www.vim.org/scripts/script.php?script_id=2340>
"
" This colorscheme is specifically created, to work in a translucent
" background provided by terminal and supports 256 color terminals
" 
" Tip -- add <t_Co=256> in your ~/.vimrc to utilize the theme well. 
"
" Thats it ! Hope you like it ! :)

let g:colors_name = "pychimp"

" The Basic (Normal) Text Style

hi Normal      ctermfg=253  ctermbg=NONE  cterm=NONE 

" All the Python related stuff 

hi Number      ctermfg=141  ctermbg=NONE  cterm=NONE
hi Float       ctermfg=141  ctermbg=NONE  cterm=NONE
hi Statement   ctermfg=208  ctermbg=NONE  cterm=bold
hi Function    ctermfg=35   ctermbg=NONE  cterm=NONE
hi Conditional ctermfg=136  ctermbg=NONE  cterm=NONE
hi Operator    ctermfg=208  ctermbg=NONE  cterm=NONE
hi Todo        ctermfg=253  ctermbg=NONE  cterm=bold
hi Comment     ctermfg=240  ctermbg=NONE  cterm=NONE
hi Special     ctermfg=81   ctermbg=NONE  cterm=NONE
hi String      ctermfg=169  ctermbg=NONE  cterm=NONE
hi Include     ctermfg=118  ctermbg=NONE  cterm=bold
hi Constant    ctermfg=178  ctermbg=NONE  cterm=bold
hi Error       ctermfg=88   ctermbg=172   cterm=bold
hi PreProc     ctermfg=81   ctermbg=NONE  cterm=NONE
hi Boolean     ctermfg=38   ctermbg=NONE  cterm=bold
hi Character   ctermfg=142  ctermbg=NONE  cterm=NONE

"Vim Stuff

hi Visual      ctermfg=253  ctermbg=235   cterm=NONE
hi VertSplit   ctermfg=232  ctermbg=244   cterm=NONE
hi ErrorMsg    ctermfg=88   ctermbg=172   cterm=bold
hi MatchParen  ctermfg=16   ctermbg=215   cterm=bold
hi Folded      ctermfg=67   ctermbg=16    cterm=bold 
hi FoldColumn  ctermfg=67   ctermbg=16    cterm=NONE
hi LineNr      ctermfg=58   ctermbg=NONE  cterm=NONE
hi NonText     ctermfg=58   ctermbg=NONE  cterm=NONE
hi Pmenu       ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuSel    ctermfg=202  ctermbg=16    cterm=NONE
hi PmenuSbar   ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuThumb  ctermfg=81   ctermbg=16    cterm=NONE 
hi Search      ctermfg=253  ctermbg=66    cterm=NONE
hi IncSearch   ctermfg=253  ctermbg=66    cterm=NONE
hi TabLine     ctermfg=3    ctermbg=NONE  cterm=NONE
hi TabLineSel  ctermfg=14   ctermbg=NONE  cterm=bold
hi TabLineFill ctermfg=46   ctermbg=NONE  cterm=NONE

" End of Colour scheme ! (Pretty small !:) )
" Will add support for more languages eventually. !
