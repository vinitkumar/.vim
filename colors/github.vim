" Vim color file
"
" Author: Anthony Carapetis <anthony.carapetis@gmail.com>
"
" Note: Based on github's syntax highlighting theme
"       Used Brian Mock's darkspectrum as a starting point/template
"       Thanks to Ryan Heath for an easy list of some of the colours:
"       http://rpheath.com/posts/356-github-theme-for-syntax-gem

hi clear

set background=light

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
      syntax reset
    endif
endif

let g:colors_name="github"

hi Normal           guifg=#000000 guibg=#F8F8FF

" Cursor
hi Cursor           guifg=#F8F8FF guibg=#000000 
hi CursorLine                     guibg=#D8D8DD
hi CursorColumn                   guibg=#E8E8EE

" Diff
hi DiffAdd          guifg=#003300 guibg=#DDFFDD gui=none
hi DiffChange                     guibg=#ECECEC gui=none
hi DiffText         guifg=#000033 guibg=#DDDDFF gui=none
hi DiffDelete       guifg=#DDCCCC guibg=#FFDDDD gui=none

" Folding / Line Numbering / Status Lines
hi Folded           guibg=#ECECEC guifg=#808080 gui=bold
hi vimFold          guibg=#ECECEC guifg=#808080 gui=bold
hi FoldColumn       guibg=#ECECEC guifg=#808080 gui=bold

hi LineNr           guifg=#A0A0A0 guibg=#ECECEC
hi NonText          guifg=#808080 guibg=#F8F8FF
hi Folded           guifg=#808080 guibg=#ECECEC gui=bold
hi FoldeColumn      guifg=#808080 guibg=#ECECEC gui=bold

hi VertSplit        guifg=#DDDDDD guibg=#DDDDDD gui=none
hi StatusLine       guifg=#404040 guibg=#DDDDDD gui=bold
hi StatusLineNC     guifg=#404040 guibg=#DDDDDD gui=italic

" Misc
hi ModeMsg          guifg=#990000
hi MoreMsg          guifg=#990000

hi Title            guifg=#ef5939
hi WarningMsg       guifg=#ef5939
hi SpecialKey       guifg=#177F80               gui=italic

hi MatchParen       guifg=#000000 guibg=#CDCDFD
hi Underlined       guifg=#000000               gui=underline
hi Directory        guifg=#990000

" Search, Visual, etc
hi Visual           guifg=#FFFFFF guibg=#3465A4 gui=none
hi VisualNOS        guifg=#FFFFFF guibg=#204A87 gui=none
hi IncSearch        guifg=#000000 guibg=#CDCDFD gui=italic
hi Search           guifg=#000000 guibg=#CDCDFD gui=italic

" Syntax groups
hi Ignore           guifg=#808080
hi Identifier       guifg=#0086B3
hi PreProc          guifg=#000000               gui=bold
hi Comment          guifg=#999988               gui=italic
hi Constant         guifg=#177F80               gui=none
hi String           guifg=#D81745 
hi Function         guifg=#990000               gui=bold
hi Statement                                    gui=bold
hi Type             guifg=#445588               gui=bold
hi Number           guifg=#1C9898
hi Todo             guifg=#FFFFFF guibg=#990000 gui=bold
hi Special          guifg=#159828
hi rubySymbol       guifg=#960B73
hi Error            guibg=#F8F8FF guifg=#FF1100 gui=undercurl
hi Todo             guibg=#F8F8FF guifg=#FF1100 gui=underline

" Completion menus
hi WildMenu         guifg=#7fbdff guibg=#425c78 gui=none
hi Pmenu            guifg=#FFFFFF guibg=#808080 gui=bold
hi PmenuSel         guifg=#000000 guibg=#CDCDFD gui=italic
hi PmenuSbar        guifg=#444444 guibg=#000000 
hi PmenuThumb       guifg=#AAAAAA guibg=#AAAAAA 

" Tabs
hi TabLine          guifg=#404040 guibg=#DDDDDD gui=none
hi TabLineFill      guifg=#404040 guibg=#DDDDDD gui=none
hi TabLineSel       guifg=#404040               gui=bold

" Spelling
hi spellBad         guisp=#FCAF3E
hi spellCap         guisp=#73D216
hi spellRare        guisp=#FCAF3E
hi spellLocal       guisp=#729FCF

" Aliases
hi link cppSTL                Function
hi link cppSTLType            Type
hi link Character             Number
hi link htmlTag               htmlEndTag
"hi link htmlTagName          htmlTag
hi link htmlLink              Underlined
hi link pythonFunction        Identifier
hi link Question              Type
hi link CursorIM              Cursor
hi link VisualNOS             Visual
hi link xmlTag                Identifier
hi link xmlTagName            Identifier
hi link shDeref               Identifier
hi link shVariable            Function
hi link rubySharpBang         Special
hi link perlSharpBang         Special
hi link schemeFunc            Statement
"hi link shSpecialVariables   Constant
"hi link bashSpecialVariables Constant
