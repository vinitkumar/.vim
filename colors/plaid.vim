" plaid.vim - We've gone to plaid.
" A tartan-inspired colorscheme tuned for lightning-fast renders.
" Author: Vinit Kumar
" License: MIT
"
" Design notes:
"   Classic Royal Stewart tartan palette: deep red base, hunter green,
"   navy blue, gold thread, cream highlight. Cursorline + cursorcolumn
"   form the crossing weave. Highlight groups are defined directly with
"   `hi` (no string interpolation) so loading is instant and Vim does
"   the minimum work per redraw.

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "plaid"

" ---------------------------------------------------------------------------
" Palette (the threads in the weave)
" ---------------------------------------------------------------------------
"   bg        #1a0a0a  deep tartan ground
"   fg        #f5e9c8  cream wool
"   red       #c8102e  Royal Stewart red
"   green     #1c5d3a  hunter green stripe
"   navy      #1f3a93  navy cross stripe
"   gold      #f1c40f  gold thread (accents, functions)
"   cream     #f5e9c8  primary text
"   muted     #8a7e5e  comments / wool dust
"   black     #0d0606  shadow between threads

" ---------------------------------------------------------------------------
" Editor UI (the loom)
" ---------------------------------------------------------------------------
hi Normal        guifg=#f5e9c8 guibg=#1a0a0a ctermfg=230 ctermbg=52 gui=NONE cterm=NONE
hi NonText       guifg=#5a3030 guibg=#1a0a0a ctermfg=95
hi EndOfBuffer   guifg=#1a0a0a guibg=#1a0a0a ctermfg=52
hi Cursor        guifg=#1a0a0a guibg=#f1c40f ctermfg=52  ctermbg=220 gui=bold cterm=bold
hi CursorLine    guibg=#22100f ctermbg=235 gui=NONE cterm=NONE
hi CursorColumn  guibg=#22100f ctermbg=235 gui=NONE cterm=NONE
hi ColorColumn   guibg=#2a1414 ctermbg=235
hi LineNr        guifg=#5a3030 guibg=#1a0a0a ctermfg=95
hi CursorLineNr  guifg=#f1c40f guibg=#22100f ctermfg=220 gui=bold cterm=bold
hi SignColumn    guifg=#f5e9c8 guibg=#1a0a0a ctermbg=52
hi VertSplit     guifg=#1c5d3a guibg=#1a0a0a ctermfg=22
hi StatusLine    guifg=#f5e9c8 guibg=#1c5d3a ctermfg=230 ctermbg=22  gui=bold cterm=bold
hi StatusLineNC  guifg=#8a7e5e guibg=#0d0606 ctermfg=101 ctermbg=233 gui=NONE cterm=NONE
hi TabLine       guifg=#8a7e5e guibg=#0d0606 ctermfg=101 ctermbg=233 gui=NONE cterm=NONE
hi TabLineFill   guifg=#8a7e5e guibg=#0d0606 ctermfg=101 ctermbg=233
hi TabLineSel    guifg=#f1c40f guibg=#1c5d3a ctermfg=220 ctermbg=22  gui=bold cterm=bold
hi Pmenu         guifg=#f5e9c8 guibg=#1f3a93 ctermfg=230 ctermbg=18
hi PmenuSel      guifg=#1a0a0a guibg=#f1c40f ctermfg=52  ctermbg=220 gui=bold cterm=bold
hi PmenuSbar     guibg=#1c5d3a ctermbg=22
hi PmenuThumb    guibg=#f1c40f ctermbg=220
hi Folded        guifg=#8a7e5e guibg=#0d0606 ctermfg=101 ctermbg=233
hi FoldColumn    guifg=#8a7e5e guibg=#1a0a0a ctermfg=101 ctermbg=52
hi MatchParen    guifg=#f1c40f guibg=#1f3a93 ctermfg=220 ctermbg=18  gui=bold cterm=bold
hi Search        guifg=#1a0a0a guibg=#f1c40f ctermfg=52  ctermbg=220
hi IncSearch     guifg=#1a0a0a guibg=#c8102e ctermfg=52  ctermbg=160 gui=bold cterm=bold
hi Visual        guibg=#1f3a93 ctermbg=18
hi VisualNOS     guibg=#1f3a93 ctermbg=18
hi WildMenu      guifg=#1a0a0a guibg=#f1c40f ctermfg=52  ctermbg=220 gui=bold cterm=bold
hi Directory     guifg=#1f3a93 ctermfg=33  gui=bold cterm=bold
hi Title         guifg=#f1c40f ctermfg=220 gui=bold cterm=bold
hi Question      guifg=#1c5d3a ctermfg=22
hi MoreMsg       guifg=#1c5d3a ctermfg=22  gui=bold cterm=bold
hi ModeMsg       guifg=#f1c40f ctermfg=220 gui=bold cterm=bold
hi WarningMsg    guifg=#f1c40f ctermfg=220 gui=bold cterm=bold
hi ErrorMsg      guifg=#f5e9c8 guibg=#c8102e ctermfg=230 ctermbg=160 gui=bold cterm=bold
hi SpecialKey    guifg=#5a3030 ctermfg=95
hi Whitespace    guifg=#3a1818 ctermfg=52
hi Conceal       guifg=#8a7e5e ctermfg=101

" ---------------------------------------------------------------------------
" Syntax (the threads themselves)
" ---------------------------------------------------------------------------
hi Comment       guifg=#8a7e5e ctermfg=101 gui=italic cterm=italic
hi Constant      guifg=#f1c40f ctermfg=220
hi String        guifg=#1c5d3a ctermfg=29
hi Character     guifg=#1c5d3a ctermfg=29
hi Number        guifg=#c8102e ctermfg=160
hi Boolean       guifg=#c8102e ctermfg=160
hi Float         guifg=#c8102e ctermfg=160
hi Identifier    guifg=#f5e9c8 ctermfg=230 gui=NONE cterm=NONE
hi Function      guifg=#f1c40f ctermfg=220 gui=bold cterm=bold
hi Statement     guifg=#c8102e ctermfg=160 gui=bold cterm=bold
hi Conditional   guifg=#c8102e ctermfg=160 gui=bold cterm=bold
hi Repeat        guifg=#c8102e ctermfg=160 gui=bold cterm=bold
hi Label         guifg=#c8102e ctermfg=160
hi Operator      guifg=#f5e9c8 ctermfg=230
hi Keyword       guifg=#c8102e ctermfg=160 gui=bold cterm=bold
hi Exception     guifg=#c8102e ctermfg=160 gui=bold cterm=bold
hi PreProc       guifg=#1f3a93 ctermfg=33
hi Include       guifg=#1f3a93 ctermfg=33  gui=bold cterm=bold
hi Define        guifg=#1f3a93 ctermfg=33
hi Macro         guifg=#1f3a93 ctermfg=33
hi PreCondit     guifg=#1f3a93 ctermfg=33
hi Type          guifg=#1c5d3a ctermfg=29  gui=bold cterm=bold
hi StorageClass  guifg=#1c5d3a ctermfg=29
hi Structure     guifg=#1c5d3a ctermfg=29
hi Typedef       guifg=#1c5d3a ctermfg=29
hi Special       guifg=#f1c40f ctermfg=220
hi SpecialChar   guifg=#f1c40f ctermfg=220
hi Tag           guifg=#1f3a93 ctermfg=33
hi Delimiter     guifg=#f5e9c8 ctermfg=230
hi SpecialComment guifg=#8a7e5e ctermfg=101 gui=italic cterm=italic
hi Debug         guifg=#c8102e ctermfg=160
hi Underlined    guifg=#1f3a93 ctermfg=33  gui=underline cterm=underline
hi Ignore        guifg=#5a3030 ctermfg=95
hi Error         guifg=#f5e9c8 guibg=#c8102e ctermfg=230 ctermbg=160
hi Todo          guifg=#1a0a0a guibg=#f1c40f ctermfg=52  ctermbg=220 gui=bold cterm=bold

" ---------------------------------------------------------------------------
" Diff (color of mended threads)
" ---------------------------------------------------------------------------
hi DiffAdd       guifg=#f5e9c8 guibg=#1c5d3a ctermfg=230 ctermbg=22
hi DiffChange    guifg=#f5e9c8 guibg=#1f3a93 ctermfg=230 ctermbg=18
hi DiffDelete    guifg=#f5e9c8 guibg=#c8102e ctermfg=230 ctermbg=160
hi DiffText      guifg=#1a0a0a guibg=#f1c40f ctermfg=52  ctermbg=220 gui=bold cterm=bold

" ---------------------------------------------------------------------------
" Spell
" ---------------------------------------------------------------------------
hi SpellBad      guisp=#c8102e gui=undercurl cterm=undercurl
hi SpellCap      guisp=#1f3a93 gui=undercurl cterm=undercurl
hi SpellRare     guisp=#f1c40f gui=undercurl cterm=undercurl
hi SpellLocal    guisp=#1c5d3a gui=undercurl cterm=undercurl

" ---------------------------------------------------------------------------
" Diagnostic / CoC (keeps signs cheap)
" ---------------------------------------------------------------------------
hi CocErrorSign     guifg=#c8102e ctermfg=160
hi CocWarningSign   guifg=#f1c40f ctermfg=220
hi CocInfoSign      guifg=#1f3a93 ctermfg=33
hi CocHintSign      guifg=#1c5d3a ctermfg=29
hi CocErrorHighlight   guisp=#c8102e gui=undercurl cterm=undercurl
hi CocWarningHighlight guisp=#f1c40f gui=undercurl cterm=undercurl

" ---------------------------------------------------------------------------
" Statusline user groups (kept identical to old vimrc indices)
" ---------------------------------------------------------------------------
hi User1 guifg=#1c5d3a guibg=#0d0606 ctermfg=22  ctermbg=233 gui=bold cterm=bold
hi User2 guifg=#f1c40f guibg=#0d0606 ctermfg=220 ctermbg=233 gui=bold cterm=bold
hi User3 guifg=#c8102e guibg=#0d0606 ctermfg=160 ctermbg=233 gui=bold cterm=bold
hi User4 guifg=#1f3a93 guibg=#0d0606 ctermfg=33  ctermbg=233 gui=bold cterm=bold
hi User5 guifg=#f5e9c8 guibg=#0d0606 ctermfg=230 ctermbg=233 gui=bold cterm=bold
