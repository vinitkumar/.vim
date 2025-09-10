" Oscura Light - A light Vim/Neovim colorscheme ported from VS Code
" Author: Vinit Kumar
" Created: March 20, 2025
" License MIT

" Setup
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "oscura-light"

" Define colors - Light theme optimized for readability
let s:bg           = "#FFFFFF"
let s:fg           = "#2D3748"
let s:comment      = "#718096"
let s:keyword      = "#2B6CB0"
let s:function     = "#805AD5"
let s:string       = "#38A169"
let s:number       = "#D69E2E"
let s:constant     = "#D69E2E"
let s:type         = "#319795"
let s:error        = "#E53E3E"
let s:warning      = "#DD6B20"
let s:special      = "#4A5568"
let s:visual       = "#E2E8F0"
let s:cursor       = "#2B6CB0"
let s:selection    = "#EDF2F7"
let s:linenum      = "#A0AEC0"
let s:linenum_act  = "#2D3748"
let s:matchbracket = "#38A169"
let s:search       = "#F6E05E"
let s:diffadd      = "#C6F6D5"
let s:diffdelete   = "#FED7D7"
let s:diffchange   = "#FEF5E7"
let s:difftext     = "#E2E8F0"
let s:link         = "#2B6CB0"
let s:attr         = "#319795"

" Helper function for setting highlight groups
function! s:Hi(group, fg, bg, attr)
  let l:cmd = "hi " . a:group
  if !empty(a:fg)
    let l:cmd .= " guifg=" . a:fg
  endif
  if !empty(a:bg)
    let l:cmd .= " guibg=" . a:bg
  endif
  if !empty(a:attr)
    let l:cmd .= " gui=" . a:attr . " cterm=" . a:attr
  endif
  execute l:cmd
endfunction

" Editor highlighting
call s:Hi("Normal", s:fg, s:bg, "")
call s:Hi("Cursor", s:bg, s:cursor, "bold")
" CursorLine set to a subtle background for light mode
call s:Hi("CursorLine", "", s:selection, "none")
call s:Hi("LineNr", s:linenum, "", "")
call s:Hi("CursorLineNr", s:linenum_act, "", "")
call s:Hi("VertSplit", s:linenum, s:bg, "")
call s:Hi("StatusLine", s:fg, s:visual, "none")
call s:Hi("StatusLineNC", s:comment, s:selection, "none")
call s:Hi("Pmenu", s:fg, s:visual, "")
call s:Hi("PmenuSel", s:bg, s:function, "")
call s:Hi("PmenuSbar", "", s:visual, "")
call s:Hi("PmenuThumb", "", s:selection, "")
call s:Hi("TabLine", s:comment, s:bg, "none")
call s:Hi("TabLineFill", s:comment, s:bg, "none")
call s:Hi("TabLineSel", s:fg, s:bg, "none")
call s:Hi("Search", s:fg, s:search, "")
call s:Hi("IncSearch", s:fg, s:search, "")
call s:Hi("MatchParen", s:bg, s:matchbracket, "")
call s:Hi("Visual", s:fg, s:visual, "")
call s:Hi("NonText", s:comment, "", "")
call s:Hi("Todo", s:function, s:bg, "italic")
call s:Hi("Underlined", s:link, "", "underline")
call s:Hi("Error", s:error, "", "")
call s:Hi("ErrorMsg", s:error, "", "")
call s:Hi("WarningMsg", s:warning, "", "")
call s:Hi("SpecialKey", s:special, "", "")
call s:Hi("Title", s:function, "", "bold")
call s:Hi("SignColumn", "", s:bg, "")
call s:Hi("DiffAdd", s:fg, s:diffadd, "")
call s:Hi("DiffDelete", s:fg, s:diffdelete, "")
call s:Hi("DiffChange", s:fg, s:diffchange, "")
call s:Hi("DiffText", s:fg, s:difftext, "")
call s:Hi("Folded", s:comment, s:selection, "")
call s:Hi("FoldColumn", s:comment, s:bg, "")
call s:Hi("Directory", s:function, "", "")
call s:Hi("SpellBad", s:error, "", "undercurl")
call s:Hi("SpellCap", s:warning, "", "undercurl")
call s:Hi("SpellRare", s:warning, "", "undercurl")
call s:Hi("SpellLocal", s:warning, "", "undercurl")
call s:Hi("ColorColumn", "", s:selection, "")
call s:Hi("QuickFixLine", "", s:selection, "none")
call s:Hi("Conceal", s:comment, s:bg, "")

" Syntax highlighting groups
call s:Hi("Comment", s:comment, "", "")
call s:Hi("Constant", s:constant, "", "")
call s:Hi("String", s:string, "", "")
call s:Hi("Character", s:string, "", "")
call s:Hi("Number", s:number, "", "")
call s:Hi("Boolean", s:constant, "", "")
call s:Hi("Float", s:number, "", "")
call s:Hi("Identifier", s:fg, "", "")
call s:Hi("Function", s:function, "", "")
call s:Hi("Statement", s:keyword, "", "")
call s:Hi("Conditional", s:keyword, "", "")
call s:Hi("Repeat", s:keyword, "", "")
call s:Hi("Label", s:keyword, "", "")
call s:Hi("Operator", s:keyword, "", "")
call s:Hi("Keyword", s:keyword, "", "")
call s:Hi("Exception", s:keyword, "", "")
call s:Hi("PreProc", s:keyword, "", "")
call s:Hi("Include", s:keyword, "", "")
call s:Hi("Define", s:keyword, "", "")
call s:Hi("Macro", s:keyword, "", "")
call s:Hi("PreCondit", s:keyword, "", "")
call s:Hi("Type", s:type, "", "")
call s:Hi("StorageClass", s:keyword, "", "")
call s:Hi("Structure", s:type, "", "")
call s:Hi("Typedef", s:type, "", "")
call s:Hi("Special", s:special, "", "")
call s:Hi("SpecialChar", s:special, "", "")
call s:Hi("Tag", s:attr, "", "")
call s:Hi("Delimiter", s:special, "", "")
call s:Hi("SpecialComment", s:comment, "", "")
call s:Hi("Debug", s:warning, "", "")
call s:Hi("WildMenu", s:fg, s:bg, "")
call s:Hi("NormalFloat", s:fg, s:visual, "")

" HTML
call s:Hi("htmlTag", s:special, "", "")
call s:Hi("htmlEndTag", s:special, "", "")
call s:Hi("htmlTagName", s:function, "", "")
call s:Hi("htmlArg", s:attr, "", "")
call s:Hi("htmlTitle", s:fg, "", "")

" CSS
call s:Hi("cssClassName", s:function, "", "")
call s:Hi("cssIdentifier", s:function, "", "")
call s:Hi("cssTagName", s:function, "", "")
call s:Hi("cssColor", s:constant, "", "")
call s:Hi("cssBraces", s:special, "", "")
call s:Hi("cssAttr", s:attr, "", "")
call s:Hi("cssAttrRegion", s:attr, "", "")
call s:Hi("cssDefinition", s:attr, "", "")
call s:Hi("cssVendor", s:attr, "", "")
call s:Hi("cssImportant", s:attr, "", "")

" JavaScript
call s:Hi("javaScript", s:fg, "", "")
call s:Hi("javaScriptBraces", s:special, "", "")
call s:Hi("javaScriptNumber", s:constant, "", "")
call s:Hi("javaScriptNull", s:constant, "", "")
call s:Hi("javaScriptIdentifier", s:keyword, "", "")
call s:Hi("javaScriptOperator", s:keyword, "", "")
call s:Hi("javaScriptFunction", s:keyword, "", "")
call s:Hi("javaScriptRegexpString", s:string, "", "")
call s:Hi("javaScriptGlobal", s:type, "", "")
call s:Hi("javaScriptMessage", s:type, "", "")
call s:Hi("javaScriptThis", s:special, "", "")

" Python
call s:Hi("pythonBuiltin", s:function, "", "bold")
call s:Hi("pythonStatement", s:keyword, "", "")
call s:Hi("pythonConditional", s:keyword, "", "")
call s:Hi("pythonRepeat", s:keyword, "", "")
call s:Hi("pythonException", s:keyword, "", "")
call s:Hi("pythonInclude", s:keyword, "", "")
call s:Hi("pythonDecorator", s:attr, "", "")
call s:Hi("pythonFunction", s:function, "", "")
call s:Hi("pythonClass", s:function, "", "")
call s:Hi("pythonOperator", s:keyword, "", "")
call s:Hi("pythonSelf", s:special, "", "")
call s:Hi("pythonDottedName", s:special, "", "")
call s:Hi("pythonComment", s:comment, "", "italic")
call s:Hi("pythonDocstring", s:comment, "", "italic")
call s:Hi("pythonString", s:string, "", "")
call s:Hi("pythonQuotes", s:string, "", "")
call s:Hi("pythonTripleQuotes", s:string, "", "")

" Markdown
call s:Hi("markdownHeadingDelimiter", s:function, "", "")
call s:Hi("markdownH1", s:function, "", "bold")
call s:Hi("markdownH2", s:function, "", "bold")
call s:Hi("markdownH3", s:function, "", "bold")
call s:Hi("markdownH4", s:function, "", "bold")
call s:Hi("markdownH5", s:function, "", "bold")
call s:Hi("markdownH6", s:function, "", "bold")
call s:Hi("markdownCode", s:special, "", "")
call s:Hi("markdownCodeBlock", s:special, "", "")
call s:Hi("markdownCodeDelimiter", s:special, "", "")
call s:Hi("markdownBlockquote", s:comment, "", "")
call s:Hi("markdownListMarker", s:function, "", "")
call s:Hi("markdownOrderedListMarker", s:function, "", "")
call s:Hi("markdownRule", s:special, "", "")
call s:Hi("markdownHeadingRule", s:special, "", "")
call s:Hi("markdownUrlDelimiter", s:special, "", "")
call s:Hi("markdownLinkDelimiter", s:special, "", "")
call s:Hi("markdownLinkTextDelimiter", s:special, "", "")
call s:Hi("markdownHeadingDelimiter", s:special, "", "")
call s:Hi("markdownUrl", s:link, "", "")
call s:Hi("markdownUrlTitleDelimiter", s:string, "", "")
call s:Hi("markdownLinkText", s:function, "", "underline")
call s:Hi("markdownIdDeclaration", s:function, "", "")

" JSON
call s:Hi("jsonKeyword", s:function, "", "")
call s:Hi("jsonString", s:string, "", "")
call s:Hi("jsonBoolean", s:constant, "", "")
call s:Hi("jsonNumber", s:constant, "", "")
call s:Hi("jsonQuote", s:special, "", "")
call s:Hi("jsonBraces", s:special, "", "")
call s:Hi("jsonNull", s:constant, "", "")

" Terminal
if has("nvim")
  let g:terminal_color_0 = s:bg
  let g:terminal_color_1 = s:error
  let g:terminal_color_2 = s:string
  let g:terminal_color_3 = s:warning
  let g:terminal_color_4 = s:keyword
  let g:terminal_color_5 = s:function
  let g:terminal_color_6 = s:type
  let g:terminal_color_7 = s:fg
  let g:terminal_color_8 = s:comment
  let g:terminal_color_9 = s:error
  let g:terminal_color_10 = s:string
  let g:terminal_color_11 = s:warning
  let g:terminal_color_12 = s:keyword
  let g:terminal_color_13 = s:function
  let g:terminal_color_14 = s:type
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

" TypeScript/JavaScript Specific
call s:Hi("typescriptBraces", s:special, "", "")
call s:Hi("typescriptParens", s:special, "", "")
call s:Hi("typescriptEndColons", s:special, "", "")
call s:Hi("typescriptModule", s:keyword, "", "")
call s:Hi("typescriptImport", s:keyword, "", "")
call s:Hi("typescriptExport", s:keyword, "", "")
call s:Hi("typescriptVariable", s:keyword, "", "")
call s:Hi("typescriptOperator", s:keyword, "", "")
call s:Hi("typescriptEnumKeyword", s:keyword, "", "")
call s:Hi("typescriptArrowFunc", s:keyword, "", "")
call s:Hi("typescriptMethodAccessor", s:keyword, "", "")
call s:Hi("typescriptAsyncFuncKeyword", s:keyword, "", "")
call s:Hi("typescriptAwaitKeyword", s:keyword, "", "")
call s:Hi("typescriptCall", s:special, "", "")
call s:Hi("typescriptClassName", s:function, "", "")
call s:Hi("typescriptClassHeritage", s:function, "", "")
call s:Hi("typescriptInterfaceName", s:function, "", "")
call s:Hi("typescriptTypeReference", s:function, "", "")
call s:Hi("typescriptFuncName", s:function, "", "")
call s:Hi("typescriptMember", s:function, "", "")
call s:Hi("typescriptObjectLabel", s:fg, "", "")
call s:Hi("typescriptCall", s:fg, "", "")
call s:Hi("typescriptBinaryOp", s:keyword, "", "")
call s:Hi("typescriptUnaryOp", s:keyword, "", "")
call s:Hi("typescriptAssign", s:keyword, "", "")
call s:Hi("typescriptConstructSignature", s:keyword, "", "")
call s:Hi("typescriptFuncType", s:special, "", "")

" String Literals in TypeScript/JavaScript
call s:Hi("typescriptStringLiteralType", s:attr, "", "")
call s:Hi("typescriptStringProperty", s:attr, "", "")
call s:Hi("typescriptObjectPropertyKey", s:attr, "", "")
call s:Hi("typescriptTemplateLiteral", s:string, "", "")
call s:Hi("typescriptString", s:string, "", "")
call s:Hi("typescriptStringS", s:string, "", "")
call s:Hi("typescriptStringD", s:string, "", "")
call s:Hi("typescriptStringB", s:string, "", "")

" Next.js Directives
call s:Hi("typescriptDirective", s:string, "", "")
call s:Hi("javascriptDirective", s:string, "", "")

" Import/Export Paths
call s:Hi("typescriptImportPath", s:fg, "", "")
call s:Hi("typescriptExportPath", s:fg, "", "")

" TSX/JSX Support
call s:Hi("tsxAttrib", s:attr, "", "")
call s:Hi("tsxTag", s:special, "", "")
call s:Hi("tsxTagName", s:function, "", "")
call s:Hi("tsxCloseTag", s:special, "", "")
call s:Hi("tsxCloseString", s:special, "", "")
call s:Hi("tsxAttributeBraces", s:special, "", "")
call s:Hi("tsxEqual", s:special, "", "")
call s:Hi("tsxString", s:fg, "", "")

" Template Strings
call s:Hi("typescriptTemplate", s:string, "", "")
call s:Hi("typescriptTemplateSubstitution", s:string, "", "")
call s:Hi("typescriptTemplateSB", s:special, "", "")

" Done!
