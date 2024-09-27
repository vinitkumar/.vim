" a dark, mostly grayscale colorscheme with judicious use of bold and italic
"
" based on jcs's eponymous colorscheme, mostly changing standout/reverse to  italic
"
" TODO: support for background switching at bottom

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "pushcx"

hi SpecialKey    cterm=bold           ctermfg=NONE
hi NonText       cterm=bold           ctermfg=NONE
hi Directory     cterm=bold           ctermfg=NONE
hi IncSearch     cterm=NONE           ctermfg=NONE ctermbg=245
hi Search        cterm=NONE           ctermfg=NONE ctermbg=245
hi MoreMsg       cterm=bold           ctermfg=NONE
hi ModeMsg       cterm=bold           ctermfg=NONE
hi LineNr        cterm=NONE           ctermfg=247
hi Question      cterm=standout       ctermfg=NONE
hi StatusLine    cterm=reverse        ctermfg=250
hi StatusLineNC  cterm=reverse        ctermfg=NONE
hi VertSplit     cterm=reverse        ctermfg=NONE
hi Title         cterm=bold           ctermfg=NONE
hi Visual        cterm=NONE           ctermfg=15   ctermbg=237
hi VisualNOS     cterm=bold,underline ctermfg=NONE
hi WarningMsg    cterm=standout       ctermfg=NONE
hi WildMenu      cterm=standout       ctermfg=NONE
hi Folded        cterm=underline      ctermfg=NONE ctermbg=NONE
hi FoldColumn    cterm=reverse        ctermfg=NONE
hi DiffAdd       cterm=NONE           ctermfg=153  ctermbg=NONE
hi DiffDelete    cterm=NONE           ctermfg=153  ctermbg=237
hi DiffText      cterm=italic         ctermfg=153  ctermbg=237
hi DiffChange    cterm=NONE           ctermfg=NONE ctermbg=237
hi Comment       cterm=italic         ctermfg=250
hi Constant      cterm=italic         ctermfg=NONE
hi Special       cterm=bold           ctermfg=NONE
hi Identifier    cterm=NONE           ctermfg=NONE
hi Statement     cterm=NONE           ctermfg=7
hi PreProc       cterm=NONE           ctermfg=7
hi Type          cterm=NONE           ctermfg=NONE
hi Underlined    cterm=underline      ctermfg=NONE
hi Ignore        cterm=bold           ctermfg=NONE
hi ErrorMsg      cterm=reverse        ctermfg=9    ctermbg=15
hi Error         cterm=reverse        ctermfg=9    ctermbg=15
hi Todo          cterm=bold           ctermfg=11   ctermbg=0
hi MatchParen    cterm=bold           ctermfg=NONE ctermbg=NONE

hi SignColumn    ctermbg=237 " ALE and signify
hi ColorColumn                                     ctermbg=243
hi SpellBad      cterm=NONE           ctermfg=1    ctermbg=NONE
hi SpellCap      cterm=NONE           ctermfg=11    ctermbg=NONE
hi SpellLocal    cterm=NONE           ctermfg=11    ctermbg=NONE
hi jsThis        cterm=NONE           ctermfg=7

" ALE
hi link ALEErrorSign SpellBad
hi link ALEWarningSign SpellCap
hi link ALEError SpellCap
hi link ALEStyleError SpellCap

" Signify
highlight SignifySignAdd    ctermbg=237 ctermfg=245
highlight SignifySignDelete ctermbg=237 ctermfg=245
highlight SignifySignChange ctermbg=237 ctermfg=245

if &background == "dark"
  " TODO: dark-bg specific here
else
  " TODO: light-bg specific here for presenting
endif