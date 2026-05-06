" lanciabones.vim - Vim colorscheme port of vinitkumar/lanciabones.nvim
" Source: https://github.com/vinitkumar/lanciabones.nvim
" Based on owickstrom's lancia palette, via zenbones.nvim.

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "lanciabones"

if &background ==# "light"
  let s:bg             = "#ffffff"
  let s:bg_muted       = "#eeeeee"
  let s:bg_subtle      = "#f7f7f7"
  let s:bg_selection   = "#dddddd"
  let s:fg             = "#000000"
  let s:fg_muted       = "#444444"
  let s:fg_muted_extra = "#999999"
  let s:constant       = "#000000"
  let s:hint           = "#222222"
  let s:warning        = "#d9961a"
  let s:error          = "#ec3305"
  let s:marker_fg      = "#000000"
  let s:marker_bg      = "#f5e97f"
else
  let s:bg             = "#000000"
  let s:bg_muted       = "#222222"
  let s:bg_subtle      = "#111111"
  let s:bg_selection   = "#333333"
  let s:fg             = "#eeeeee"
  let s:fg_muted       = "#aaaaaa"
  let s:fg_muted_extra = "#777777"
  let s:constant       = "#b36957"
  let s:hint           = "#cccccc"
  let s:warning        = "#b18532"
  let s:error          = "#ec3305"
  let s:marker_fg      = "#f5e97f"
  let s:marker_bg      = "#000000"
endif

let s:cterm = {}
let s:cterm["#000000"] = "16"
let s:cterm["#ffffff"] = "231"
let s:cterm["#eeeeee"] = "255"
let s:cterm["#f7f7f7"] = "255"
let s:cterm["#dddddd"] = "253"
let s:cterm["#aaaaaa"] = "248"
let s:cterm["#999999"] = "246"
let s:cterm["#777777"] = "243"
let s:cterm["#444444"] = "238"
let s:cterm["#333333"] = "236"
let s:cterm["#222222"] = "235"
let s:cterm["#111111"] = "233"
let s:cterm["#b36957"] = "131"
let s:cterm["#cccccc"] = "252"
let s:cterm["#b18532"] = "136"
let s:cterm["#d9961a"] = "172"
let s:cterm["#ec3305"] = "202"
let s:cterm["#f5e97f"] = "228"

function! s:Cterm(color) abort
  return get(s:cterm, tolower(a:color), "NONE")
endfunction

function! s:Hi(group, fg, bg, attr, sp) abort
  let l:cmd = "highlight " . a:group

  if empty(a:fg)
    let l:cmd .= " guifg=NONE ctermfg=NONE"
  else
    let l:cmd .= " guifg=" . a:fg . " ctermfg=" . s:Cterm(a:fg)
  endif

  if empty(a:bg)
    let l:cmd .= " guibg=NONE ctermbg=NONE"
  else
    let l:cmd .= " guibg=" . a:bg . " ctermbg=" . s:Cterm(a:bg)
  endif

  if empty(a:attr)
    let l:cmd .= " gui=NONE cterm=NONE"
  else
    let l:cmd .= " gui=" . a:attr . " cterm=" . a:attr
  endif

  if !empty(a:sp)
    let l:cmd .= " guisp=" . a:sp
  endif

  execute l:cmd
endfunction

" Editor
call s:Hi("Normal", s:fg, s:bg, "", "")
call s:Hi("NormalNC", s:fg, s:bg, "", "")
call s:Hi("NormalFloat", s:fg, s:bg_muted, "", "")
call s:Hi("FloatBorder", s:fg_muted_extra, s:bg_muted, "", "")
call s:Hi("Cursor", s:bg, s:fg, "", "")
call s:Hi("CursorLine", "", s:bg_subtle, "", "")
call s:Hi("CursorColumn", "", s:bg_subtle, "", "")
call s:Hi("LineNr", s:fg_muted_extra, "", "", "")
call s:Hi("CursorLineNr", s:fg, s:bg_subtle, "", "")
call s:Hi("SignColumn", "", s:bg, "", "")
call s:Hi("ColorColumn", "", s:bg_subtle, "", "")
call s:Hi("VertSplit", s:fg_muted_extra, s:bg, "", "")
call s:Hi("WinSeparator", s:fg_muted_extra, s:bg, "", "")
call s:Hi("StatusLine", s:fg, s:bg_muted, "", "")
call s:Hi("StatusLineNC", s:fg_muted_extra, s:bg_subtle, "", "")
call s:Hi("TabLine", s:fg_muted, s:bg_subtle, "", "")
call s:Hi("TabLineFill", s:fg_muted_extra, s:bg_subtle, "", "")
call s:Hi("TabLineSel", s:fg, s:bg, "", "")
call s:Hi("Pmenu", s:fg, s:bg, "", "")
call s:Hi("PmenuSel", s:fg, s:bg_muted, "", "")
call s:Hi("PmenuSbar", "", s:bg_subtle, "", "")
call s:Hi("PmenuThumb", "", s:fg_muted_extra, "", "")
call s:Hi("WildMenu", s:fg, s:bg_muted, "", "")
call s:Hi("Visual", "", s:bg_selection, "", "")
call s:Hi("VisualNOS", "", s:bg_selection, "", "")
call s:Hi("Search", s:marker_fg, s:marker_bg, "", "")
call s:Hi("IncSearch", s:bg, s:warning, "", "")
call s:Hi("CurSearch", s:bg, s:warning, "", "")
call s:Hi("MatchParen", s:fg, s:bg_muted, "bold", "")
call s:Hi("Directory", s:fg, "", "bold", "")
call s:Hi("Folded", s:fg_muted, s:bg_muted, "", "")
call s:Hi("FoldColumn", s:fg_muted_extra, s:bg, "", "")
call s:Hi("NonText", s:fg_muted_extra, "", "", "")
call s:Hi("SpecialKey", s:fg_muted_extra, "", "", "")
call s:Hi("EndOfBuffer", s:bg, "", "", "")
call s:Hi("Conceal", s:fg_muted_extra, "", "", "")
call s:Hi("Question", s:fg, "", "bold", "")
call s:Hi("MoreMsg", s:fg, "", "bold", "")
call s:Hi("ModeMsg", s:fg, "", "bold", "")
call s:Hi("Title", s:fg, "", "bold", "")
call s:Hi("Todo", s:marker_fg, s:marker_bg, "bold,italic", "")
call s:Hi("ErrorMsg", s:error, "", "", "")
call s:Hi("WarningMsg", s:warning, "", "", "")

" Syntax
call s:Hi("Comment", s:marker_fg, s:marker_bg, "italic", "")
call s:Hi("Constant", s:constant, "", "", "")
call s:Hi("String", s:constant, "", "", "")
call s:Hi("Character", s:constant, "", "", "")
call s:Hi("Number", s:constant, "", "", "")
call s:Hi("Boolean", s:constant, "", "", "")
call s:Hi("Float", s:constant, "", "", "")
call s:Hi("Identifier", s:fg, "", "", "")
call s:Hi("Function", s:fg, "", "", "")
call s:Hi("Statement", s:fg, "", "", "")
call s:Hi("Conditional", s:fg, "", "", "")
call s:Hi("Repeat", s:fg, "", "", "")
call s:Hi("Label", s:fg, "", "", "")
call s:Hi("Operator", s:fg_muted, "", "", "")
call s:Hi("Keyword", s:fg, "", "", "")
call s:Hi("Exception", s:fg, "", "", "")
call s:Hi("PreProc", s:fg, "", "", "")
call s:Hi("Include", s:fg, "", "", "")
call s:Hi("Define", s:fg, "", "", "")
call s:Hi("Macro", s:fg, "", "", "")
call s:Hi("PreCondit", s:fg, "", "", "")
call s:Hi("Type", s:fg, "", "italic", "")
call s:Hi("StorageClass", s:fg, "", "italic", "")
call s:Hi("Structure", s:fg, "", "italic", "")
call s:Hi("Typedef", s:fg, "", "italic", "")
call s:Hi("Special", s:hint, "", "italic", "")
call s:Hi("SpecialChar", s:hint, "", "italic", "")
call s:Hi("Tag", s:hint, "", "", "")
call s:Hi("Delimiter", s:fg_muted, "", "", "")
call s:Hi("SpecialComment", s:marker_fg, s:marker_bg, "italic", "")
call s:Hi("Debug", s:warning, "", "", "")
call s:Hi("Underlined", s:hint, "", "underline", "")
call s:Hi("Ignore", s:fg_muted_extra, "", "", "")
call s:Hi("Error", s:error, "", "", "")

" Diffs and diagnostics
call s:Hi("DiffAdd", s:fg, s:bg_muted, "", "")
call s:Hi("DiffChange", s:fg, s:bg_subtle, "", "")
call s:Hi("DiffDelete", s:error, s:bg, "", "")
call s:Hi("DiffText", s:fg, s:bg_selection, "bold", "")
call s:Hi("SpellBad", "", "", "undercurl", s:error)
call s:Hi("SpellCap", "", "", "undercurl", s:warning)
call s:Hi("SpellRare", "", "", "undercurl", s:hint)
call s:Hi("SpellLocal", "", "", "undercurl", s:hint)
call s:Hi("DiagnosticError", s:error, "", "", "")
call s:Hi("DiagnosticWarn", s:warning, "", "", "")
call s:Hi("DiagnosticInfo", s:fg, "", "", "")
call s:Hi("DiagnosticHint", s:hint, "", "", "")
call s:Hi("DiagnosticUnderlineError", "", "", "undercurl", s:error)
call s:Hi("DiagnosticUnderlineWarn", "", "", "undercurl", s:warning)
call s:Hi("DiagnosticUnderlineInfo", "", "", "undercurl", s:hint)
call s:Hi("DiagnosticUnderlineHint", s:fg, "", "undercurl", s:hint)
call s:Hi("LspDiagnosticsDefaultError", s:error, "", "", "")
call s:Hi("LspDiagnosticsDefaultWarning", s:warning, "", "", "")
call s:Hi("LspDiagnosticsDefaultInformation", s:fg, "", "", "")
call s:Hi("LspDiagnosticsDefaultHint", s:hint, "", "", "")
call s:Hi("LspDiagnosticsUnderlineError", "", "", "undercurl", s:error)
call s:Hi("LspDiagnosticsUnderlineWarning", "", "", "undercurl", s:warning)
call s:Hi("LspDiagnosticsUnderlineInformation", "", "", "undercurl", s:hint)
call s:Hi("LspDiagnosticsUnderlineHint", s:fg, "", "undercurl", s:hint)

" Common plugin groups
call s:Hi("GitGutterAdd", s:fg, "", "", "")
call s:Hi("GitGutterChange", s:warning, "", "", "")
call s:Hi("GitGutterDelete", s:error, "", "", "")
call s:Hi("NeogitSubtleText", s:fg_muted, "", "", "")
call s:Hi("qfLineNr", s:fg_muted_extra, "", "", "")
call s:Hi("QuickFixLine", s:fg, s:bg_muted, "", "")

let g:terminal_ansi_colors = [s:bg, s:error, s:fg_muted, s:warning, s:hint, s:constant, s:fg_muted_extra, s:fg, s:bg_muted, s:error, s:fg_muted, s:warning, s:hint, s:constant, s:fg_muted_extra, s:fg]

unlet s:bg s:bg_muted s:bg_subtle s:bg_selection s:fg s:fg_muted
unlet s:fg_muted_extra s:constant s:hint s:warning s:error
unlet s:marker_fg s:marker_bg s:cterm
