" Oscura - A dark Vim/Neovim colorscheme ported from VS Code
" Author: Claude
" Created: March 20, 2025

" Setup
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "oscura"

" Define colors
let s:bg           = "#0B0B0F"
let s:fg           = "#E6E6E6"
let s:comment      = "#46474F"
let s:keyword      = "#9099A1"
let s:function     = "#E6E7A3"
let s:string       = "#F9B98C"
let s:number       = "#F9B98C"
let s:constant     = "#F9B98C"
let s:type         = "#E6E7A3"
let s:error        = "#D84F68"
let s:warning      = "#FF5C5C"
let s:special      = "#9592A4"
let s:visual       = "#333740"    " Changed from #EAEC8A21 (removed alpha)
let s:cursor       = "#FFFFFF"
let s:selection    = "#5A5B63"
let s:linenum      = "#32333B"
let s:linenum_act  = "#E6E6E6"
let s:matchbracket = "#6E7048"    " Changed from #EAEC8A54 (removed alpha)
let s:search       = "#6E7048"    " Changed from #EAEC8A54 (removed alpha)
let s:diffadd      = "#1E2721"    " Changed from #E6E6E615 (removed alpha)
let s:diffdelete   = "#2D1D22"    " Changed from #D84F6815 (removed alpha)
let s:diffchange   = "#1E2721"    " Changed from #E6E6E615 (removed alpha)
let s:difftext     = "#303030"    " Changed from #E6E6E630 (removed alpha)
let s:link         = "#479FFA"
let s:attr         = "#54C0A3"

" Helper function for setting highlight groups
function! s:h(group, fg, bg, attr)
  if a:fg != ""
    exec "hi " . a:group . " guifg=" . a:fg
  endif
  if a:bg != ""
    exec "hi " . a:group . " guibg=" . a:bg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr
  endif
endfunction

" Editor highlighting
call s:h("Normal", s:fg, s:bg, "")
call s:h("Cursor", s:bg, s:cursor, "")
call s:h("CursorLine", "", "#191919", "none")
call s:h("LineNr", s:linenum, "", "")
call s:h("CursorLineNr", s:linenum_act, "", "")
call s:h("VertSplit", s:linenum, s:bg, "")
call s:h("StatusLine", s:fg, "#232323", "none")
call s:h("StatusLineNC", s:comment, "#191919", "none")
call s:h("Pmenu", s:fg, "#2C2C31", "")
call s:h("PmenuSel", s:bg, s:function, "")
call s:h("PmenuSbar", "", "#2C2C31", "")
call s:h("PmenuThumb", "", s:selection, "")
call s:h("TabLine", s:comment, s:bg, "none")
call s:h("TabLineFill", s:comment, s:bg, "none")
call s:h("TabLineSel", s:fg, s:bg, "none")
call s:h("Search", s:bg, s:search, "")
call s:h("IncSearch", s:bg, s:search, "")
call s:h("MatchParen", "", s:matchbracket, "")
call s:h("Visual", "", s:visual, "")
call s:h("NonText", s:comment, "", "")
call s:h("Todo", s:function, s:bg, "italic")
call s:h("Underlined", s:link, "", "underline")
call s:h("Error", s:error, "", "")
call s:h("ErrorMsg", s:error, "", "")
call s:h("WarningMsg", s:warning, "", "")
call s:h("SpecialKey", s:special, "", "")
call s:h("Title", s:function, "", "bold")
call s:h("SignColumn", "", s:bg, "")
call s:h("DiffAdd", "", s:diffadd, "")
call s:h("DiffDelete", s:diffdelete, s:diffdelete, "")
call s:h("DiffChange", "", s:diffchange, "")
call s:h("DiffText", "", s:difftext, "")
call s:h("Folded", s:comment, "#191919", "")
call s:h("FoldColumn", s:comment, s:bg, "")
call s:h("Directory", s:function, "", "")
call s:h("SpellBad", s:error, "", "undercurl")
call s:h("SpellCap", s:warning, "", "undercurl")
call s:h("SpellRare", s:warning, "", "undercurl")
call s:h("SpellLocal", s:warning, "", "undercurl")
call s:h("ColorColumn", "", "#232323", "")
call s:h("QuickFixLine", "", "#232323", "none")
call s:h("Conceal", s:comment, s:bg, "")

" Syntax highlighting groups
call s:h("Comment", s:comment, "", "")
call s:h("Constant", s:constant, "", "")
call s:h("String", s:string, "", "")
call s:h("Character", s:string, "", "")
call s:h("Number", s:number, "", "")
call s:h("Boolean", s:constant, "", "")
call s:h("Float", s:number, "", "")
call s:h("Identifier", s:fg, "", "")
call s:h("Function", s:function, "", "")
call s:h("Statement", s:keyword, "", "")
call s:h("Conditional", s:keyword, "", "")
call s:h("Repeat", s:keyword, "", "")
call s:h("Label", s:keyword, "", "")
call s:h("Operator", s:keyword, "", "")
call s:h("Keyword", s:keyword, "", "")
call s:h("Exception", s:keyword, "", "")
call s:h("PreProc", s:keyword, "", "")
call s:h("Include", s:keyword, "", "")
call s:h("Define", s:keyword, "", "")
call s:h("Macro", s:keyword, "", "")
call s:h("PreCondit", s:keyword, "", "")
call s:h("Type", s:type, "", "")
call s:h("StorageClass", s:keyword, "", "")
call s:h("Structure", s:type, "", "")
call s:h("Typedef", s:type, "", "")
call s:h("Special", s:special, "", "")
call s:h("SpecialChar", s:special, "", "")
call s:h("Tag", s:attr, "", "")
call s:h("Delimiter", s:special, "", "")
call s:h("SpecialComment", s:comment, "", "")
call s:h("Debug", s:warning, "", "")
call s:h("WildMenu", s:fg, s:bg, "")
call s:h("NormalFloat", s:fg, "#161616", "")

" HTML
call s:h("htmlTag", s:special, "", "")
call s:h("htmlEndTag", s:special, "", "")
call s:h("htmlTagName", s:function, "", "")
call s:h("htmlArg", s:attr, "", "")
call s:h("htmlTitle", s:fg, "", "")

" CSS
call s:h("cssClassName", s:function, "", "")
call s:h("cssIdentifier", s:function, "", "")
call s:h("cssTagName", s:function, "", "")
call s:h("cssColor", s:constant, "", "")
call s:h("cssBraces", s:special, "", "")
call s:h("cssAttr", s:attr, "", "")
call s:h("cssAttrRegion", s:attr, "", "")
call s:h("cssDefinition", s:attr, "", "")
call s:h("cssVendor", s:attr, "", "")
call s:h("cssImportant", s:attr, "", "")

" JavaScript
call s:h("javaScript", s:fg, "", "")
call s:h("javaScriptBraces", s:special, "", "")
call s:h("javaScriptNumber", s:constant, "", "")
call s:h("javaScriptNull", s:constant, "", "")
call s:h("javaScriptIdentifier", s:keyword, "", "")
call s:h("javaScriptOperator", s:keyword, "", "")
call s:h("javaScriptFunction", s:keyword, "", "")
call s:h("javaScriptRegexpString", s:string, "", "")
call s:h("javaScriptGlobal", s:type, "", "")
call s:h("javaScriptMessage", s:type, "", "")
call s:h("javaScriptThis", s:special, "", "")

" Python
call s:h("pythonBuiltin", s:function, "", "bold")
call s:h("pythonStatement", s:keyword, "", "")
call s:h("pythonConditional", s:keyword, "", "")
call s:h("pythonRepeat", s:keyword, "", "")
call s:h("pythonException", s:keyword, "", "")
call s:h("pythonInclude", s:keyword, "", "")
call s:h("pythonDecorator", s:attr, "", "")
call s:h("pythonFunction", s:function, "", "")
call s:h("pythonClass", s:function, "", "")
call s:h("pythonOperator", s:keyword, "", "")
call s:h("pythonSelf", s:special, "", "")
call s:h("pythonDottedName", s:special, "", "")
call s:h("pythonComment", s:comment, "", "italic")
call s:h("pythonDocstring", s:comment, "", "italic")
call s:h("pythonString", s:string, "", "")
call s:h("pythonQuotes", s:string, "", "")
call s:h("pythonTripleQuotes", s:string, "", "")

" Markdown
call s:h("markdownHeadingDelimiter", s:function, "", "")
call s:h("markdownH1", s:function, "", "bold")
call s:h("markdownH2", s:function, "", "bold")
call s:h("markdownH3", s:function, "", "bold")
call s:h("markdownH4", s:function, "", "bold")
call s:h("markdownH5", s:function, "", "bold")
call s:h("markdownH6", s:function, "", "bold")
call s:h("markdownCode", s:special, "", "")
call s:h("markdownCodeBlock", s:special, "", "")
call s:h("markdownCodeDelimiter", s:special, "", "")
call s:h("markdownBlockquote", s:comment, "", "")
call s:h("markdownListMarker", s:function, "", "")
call s:h("markdownOrderedListMarker", s:function, "", "")
call s:h("markdownRule", s:special, "", "")
call s:h("markdownHeadingRule", s:special, "", "")
call s:h("markdownUrlDelimiter", s:special, "", "")
call s:h("markdownLinkDelimiter", s:special, "", "")
call s:h("markdownLinkTextDelimiter", s:special, "", "")
call s:h("markdownHeadingDelimiter", s:special, "", "")
call s:h("markdownUrl", s:link, "", "")
call s:h("markdownUrlTitleDelimiter", s:string, "", "")
call s:h("markdownLinkText", s:function, "", "underline")
call s:h("markdownIdDeclaration", s:function, "", "")

" JSON
call s:h("jsonKeyword", s:function, "", "")
call s:h("jsonString", s:string, "", "")
call s:h("jsonBoolean", s:constant, "", "")
call s:h("jsonNumber", s:constant, "", "")
call s:h("jsonQuote", s:special, "", "")
call s:h("jsonBraces", s:special, "", "")
call s:h("jsonNull", s:constant, "", "")

" Terminal
if has("nvim")
  let g:terminal_color_0 = s:bg
  let g:terminal_color_1 = s:error
  let g:terminal_color_2 = s:function
  let g:terminal_color_3 = s:string
  let g:terminal_color_4 = s:special
  let g:terminal_color_5 = s:keyword
  let g:terminal_color_6 = s:attr
  let g:terminal_color_7 = s:fg
  let g:terminal_color_8 = s:comment
  let g:terminal_color_9 = s:error
  let g:terminal_color_10 = s:function
  let g:terminal_color_11 = s:string
  let g:terminal_color_12 = s:special
  let g:terminal_color_13 = s:keyword
  let g:terminal_color_14 = s:attr
  let g:terminal_color_15 = s:fg
endif

" TreeSitter support (for Neovim)
if has("nvim")
  " Identifiers
  hi! link @variable Identifier
  hi! link @variable.builtin Special
  hi! link @variable.parameter Special
  hi! link @variable.member Identifier
  hi! link @constant Constant
  hi! link @constant.builtin Special
  hi! link @constant.macro Define
  hi! link @module Type
  hi! link @label Label
  hi! link @symbol Special

  " Functions
  hi! link @function Function
  hi! link @function.builtin Special
  hi! link @function.macro Macro
  hi! link @method Function
  hi! link @constructor Function
  hi! link @parameter Special

  " Keywords
  hi! link @keyword Keyword
  hi! link @keyword.function Keyword
  hi! link @keyword.operator Operator
  hi! link @keyword.return Keyword
  hi! link @conditional Conditional
  hi! link @repeat Repeat
  hi! link @debug Debug
  hi! link @exception Exception
  hi! link @include Include
  hi! link @define Define

  " Types
  hi! link @type Type
  hi! link @type.builtin Type
  hi! link @type.qualifier StorageClass
  hi! link @type.definition Typedef
  hi! link @storageclass StorageClass
  hi! link @namespace Identifier
  hi! link @attribute Special
  hi! link @property Identifier
  hi! link @field Identifier

  " Literals
  hi! link @string String
  hi! link @string.regex String
  hi! link @string.escape SpecialChar
  hi! link @string.special SpecialChar
  hi! link @character Character
  hi! link @character.special SpecialChar
  hi! link @boolean Boolean
  hi! link @number Number
  hi! link @float Float

  " Markup
  hi! link @text.strong Bold
  hi! link @text.emphasis Italic
  hi! link @text.underline Underlined
  hi! link @text.strike Comment
  hi! link @text.title Title
  hi! link @text.literal String
  hi! link @text.uri Underlined
  hi! link @text.reference Identifier
  hi! link @tag Tag
  hi! link @tag.attribute Label
  hi! link @tag.delimiter Special

  " Comments
  hi! link @comment Comment
  hi! link @comment.documentation SpecialComment

  " Punctuation
  hi! link @punctuation.delimiter Delimiter
  hi! link @punctuation.bracket Delimiter
  hi! link @punctuation.special Delimiter

  " Misc
  hi! link @error Error
  hi! link @danger Error
  hi! link @todo Todo
endif

" Done!
