runtime! colors/solarized.vim

" Make the vertical split column blend with the line number
" column.
highlight LineNr cterm=NONE ctermbg=Black ctermfg=Green
highlight! link CursorLineNr LineNr
highlight VertSplit cterm=NONE ctermbg=Black ctermfg=Green

" Make the status line blend with the line number column.
"
" HACK(strager): If the following are all true, Vim will
" force the 'fillchars stl item to '^':
"
" * The StatusLine and StatusLine highlight attributes are
"   equivalent
" * The stl and stlnc items are equal
" * The window being drawn is the current window
"
" We don't want this, so choose slightly different colours
" so we hopefully don't notice any difference.
highlight StatusLine cterm=NONE ctermbg=Black ctermfg=Blue
highlight StatusLineNC cterm=NONE ctermbg=Black ctermfg=Green

highlight SpellBad cterm=undercurl ctermfg=Red guisp=#dc322f
highlight SpellCap cterm=undercurl ctermfg=Red guisp=#dc322f

" Deemphasize tab indicators ('list).
highlight SpecialKey cterm=NONE ctermfg=0 ctermbg=NONE

" Make C++ modifiers like 'explicit' not look like types.
highlight! link cppModifier cStorageClass

let colors_name = 'strager'
