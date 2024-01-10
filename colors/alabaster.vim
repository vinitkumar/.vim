" alabaster.vim

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "alabaster"

if &background == "dark"
  let g:terminal_color_0 = "#000000"
  let g:terminal_color_1 = "#d2322d"
  let g:terminal_color_2 = "#6abf40"
  " etc for all terminal colors
endif

" Colors
let s:bg = "#0e1415"
let s:fg = "#cecece"
let s:punct_fg = "#708b8d"
let s:def_fg = "#71ade7"
" etc for all colors

" Highlight groups
hi ColorColumn ctermbg=#E2EEEE
hi Cursor ctermbg=active ctermfg=#000000
hi CursorLine ctermbg=#182325
hi DiffAdd ctermbg=#244032 ctermfg=#56d364
hi DiffDelete ctermbg=#462c32 ctermfg=#f85149
" etc for all highlight groups

