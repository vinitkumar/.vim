" Vim color file based on David Schweikert's "delek"
" Last Change:	2010 Feb 2

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ambvlight"

if version >= 700
  hi CursorLine cterm=NONE ctermbg=253 guibg=#1c1c1c
  hi CursorColumn ctermbg=253 guibg=#1c1c1c
endif

" Normal should come first
" hi Normal
" hi Cursor
" hi lCursor

" Note: we never set 'term' because the defaults for B&W terminals are OK
hi Conceal    guifg=#ff0000 guibg=#00ff00
hi DiffAdd    ctermbg=253 guibg=#1c1c1c
hi DiffChange ctermbg=229 guibg=#262626
hi DiffDelete ctermfg=DarkRed ctermbg=217 guifg=#5f0000 guibg=#000000
hi DiffText   ctermbg=221 guibg=#444444 guifg=#ffffff gui=NONE
hi Directory  ctermfg=244 guifg=#2222ee
hi Error      ctermfg=White	   ctermbg=DarkRed gui=BOLD guifg=#efaaaa guibg=#cd2222
hi ErrorMsg   ctermfg=White	   ctermbg=DarkRed gui=BOLD guifg=#ffffff guibg=#cd2222
hi FoldColumn ctermbg=253 guifg=#7c7c7c guibg=#111111
hi Folded     ctermbg=Grey guifg=#7c7c7c guibg=#111111
hi IncSearch  cterm=reverse gui=reverse
hi LineNr     ctermfg=242	guifg=#7c7c7c
hi ModeMsg    cterm=bold gui=BOLD
hi MoreMsg    ctermfg=DarkGreen guifg=#22cd22
hi NonText    ctermfg=237 guifg=#3a3a3a
hi Pmenu      ctermfg=White    ctermbg=240 guifg=#ffffff guibg=#585858
hi PmenuSel   ctermfg=Black	   ctermbg=250 guifg=#000000 guibg=#bcbcbc
hi Question   ctermfg=DarkGreen guifg=#22cd22
hi Search     ctermfg=NONE	   ctermbg=236 guifg=NONE guibg=#2222ee
hi SpecialKey ctermfg=DarkBlue guifg=#2222ee
hi StatusLine 	   ctermfg=240 ctermbg=white guifg=#585858 guibg=#ffffff
hi StatusLineNC	   ctermfg=238 ctermbg=253 guifg=#444444 guibg=#dadada
hi Title      ctermfg=DarkMagenta guifg=#cd22cd
hi VertSplit  ctermfg=250 guifg=#444444
hi Visual     ctermbg=250 guibg=#262626
hi VisualNOS  cterm=underline,bold gui=underline,bold
hi WarningMsg ctermfg=DarkRed guifg=#cd2222
hi WildMenu   ctermfg=Black	   ctermbg=250 guifg=#000000 guibg=#bcbcbc

" syntax highlighting
hi Comment    cterm=NONE ctermfg=DarkRed gui=NONE guifg=#cd2222
hi Constant   cterm=NONE ctermfg=DarkGreen gui=NONE guifg=#22cd22
hi Identifier cterm=NONE ctermfg=DarkCyan gui=BOLD guifg=#22cdcd
hi PreProc    cterm=NONE ctermfg=DarkMagenta gui=NONE guifg=#cd22cd
hi Special    cterm=NONE ctermfg=60 gui=NONE guifg=#5f5f87
hi Statement  cterm=bold ctermfg=Blue gui=BOLD guifg=#7c7cff
hi Type	      cterm=NONE ctermfg=Blue gui=BOLD guifg=#7c7cff
hi Structure  cterm=NONE ctermfg=Blue gui=italic guifg=#7c7cff
hi Exception  cterm=NONE ctermfg=DarkCyan gui=italic guifg=#22cdcd

hi OverLength ctermbg=222 guibg=#fffafa
hi ExtraWhitespace ctermbg=222 guibg=#fffafa
hi PyFlakes ctermbg=222 guibg=#fffafa
