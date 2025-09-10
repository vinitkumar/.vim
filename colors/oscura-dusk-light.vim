" Oscura Dusk Light - A light Vim/Neovim colorscheme based on oscura-dusk
" Author: Vinit Kumar
" Created: March 20, 2025
" License MIT

" Setup
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "oscura-dusk-light"

" Define colors - Light version of oscura-dusk palette
" Background and foreground colors
let s:bg           = "#F8F9FA"    " Light background (was #131419)
let s:fg           = "#2D3748"    " Dark foreground (was #E6E6E6)
let s:comment      = "#718096"    " Muted gray for comments (was #46474F)
let s:keyword      = "#4A5568"    " Dark gray for keywords (was #9099A1)
let s:function     = "#2B6CB0"    " Blue for functions (was #E6E7A3)
let s:string       = "#C05621"    " Orange for strings (was #F9B98C)
let s:number       = "#C05621"    " Orange for numbers (was #F9B98C)
let s:constant     = "#C05621"    " Orange for constants (was #F9B98C)
let s:type         = "#2B6CB0"    " Blue for types (was #E6E7A3)
let s:error        = "#E53E3E"    " Red for errors (was #FF5C5C)
let s:warning      = "#D69E2E"    " Yellow for warnings (was #D2D714)
let s:special      = "#4A5568"    " Dark gray for special chars (was #9592A4)
let s:visual       = "#E2E8F0"    " Light blue for visual selection (was #232323)
let s:cursor       = "#2B6CB0"    " Blue cursor (was #FFCC00)
let s:selection    = "#CBD5E0"    " Light gray for selection (was #5A5B63)
let s:linenum      = "#A0AEC0"    " Light gray for line numbers (was #32333B)
let s:linenum_act  = "#2D3748"    " Dark for active line number (was #E6E6E6)
let s:matchbracket = "#E2E8F0"    " Light background for matching brackets (was #5C6974)
let s:search       = "#FEF5E7"    " Light yellow for search (was #5C6974)
let s:diffadd      = "#C6F6D5"    " Light green for additions (was #4EBE96)
let s:diffdelete   = "#FED7D7"    " Light red for deletions (was #FF5C5C)
let s:diffchange   = "#FEF5E7"    " Light yellow for changes (was #4EBE96)
let s:difftext     = "#E2E8F0"    " Light gray for diff text (was #303030)
let s:link         = "#3182CE"    " Blue for links (was #479FFA)
let s:attr         = "#38A169"    " Green for attributes (was #54C0A3)

" Highlight helper
execute "command! -nargs=+ Hi hi <args>"

" Editor highlighting
execute "hi Normal guifg=".s:fg." guibg=".s:bg
execute "hi Cursor guifg=".s:bg." guibg=".s:cursor." gui=bold"
execute "hi CursorLine guibg=".s:visual." gui=none"
execute "hi LineNr guifg=".s:linenum
execute "hi CursorLineNr guifg=".s:linenum_act
execute "hi VertSplit guifg=".s:linenum." guibg=".s:bg
execute "hi StatusLine guifg=".s:fg." guibg=".s:visual." gui=none"
execute "hi StatusLineNC guifg=".s:comment." guibg=".s:selection." gui=none"
execute "hi Pmenu guifg=".s:fg." guibg=".s:visual
execute "hi PmenuSel guifg=".s:bg." guibg=".s:function
execute "hi PmenuSbar guibg=".s:visual
execute "hi PmenuThumb guibg=".s:selection
execute "hi TabLine guifg=".s:comment." guibg=".s:bg." gui=none"
execute "hi TabLineFill guifg=".s:comment." guibg=".s:bg." gui=none"
execute "hi TabLineSel guifg=".s:fg." guibg=".s:bg." gui=none"
execute "hi Search guifg=".s:fg." guibg=".s:search
execute "hi IncSearch guifg=".s:fg." guibg=".s:search
execute "hi MatchParen guibg=".s:matchbracket
execute "hi Visual guibg=".s:visual
execute "hi NonText guifg=".s:comment." guibg=".s:bg
execute "hi Todo guifg=".s:function." guibg=".s:bg." gui=italic"
execute "hi Underlined guifg=".s:link." gui=underline"
execute "hi Error guifg=".s:error." guibg=".s:bg
execute "hi ErrorMsg guifg=".s:error." guibg=".s:bg
execute "hi WarningMsg guifg=".s:warning." guibg=".s:bg
execute "hi SpecialKey guifg=".s:special." guibg=".s:bg
execute "hi Title guifg=".s:function." gui=bold"
execute "hi SignColumn guifg=".s:comment." guibg=".s:bg
execute "hi DiffAdd guifg=".s:fg." guibg=".s:diffadd
execute "hi DiffDelete guifg=".s:error." guibg=".s:diffdelete
execute "hi DiffChange guifg=".s:fg." guibg=".s:diffchange
execute "hi DiffText guifg=".s:fg." guibg=".s:difftext
execute "hi Folded guifg=".s:comment." guibg=".s:visual
execute "hi FoldColumn guifg=".s:comment." guibg=".s:bg
execute "hi Directory guifg=".s:function." guibg=".s:bg
execute "hi SpellBad guifg=".s:error." gui=undercurl"
execute "hi SpellCap guifg=".s:warning." gui=undercurl"
execute "hi SpellRare guifg=".s:warning." gui=undercurl"
execute "hi SpellLocal guifg=".s:warning." gui=undercurl"
execute "hi ColorColumn guibg=".s:visual
execute "hi QuickFixLine guibg=".s:visual." gui=none"
execute "hi Conceal guifg=".s:comment." guibg=".s:bg

" Syntax highlighting
execute "hi Comment guifg=".s:comment
execute "hi Constant guifg=".s:constant
execute "hi String guifg=".s:string
execute "hi Character guifg=".s:string
execute "hi Number guifg=".s:number
execute "hi Boolean guifg=".s:constant
execute "hi Float guifg=".s:number
execute "hi Function guifg=".s:function
execute "hi Identifier guifg=".s:fg
execute "hi Statement guifg=".s:keyword
execute "hi Conditional guifg=".s:keyword
execute "hi Repeat guifg=".s:keyword
execute "hi Label guifg=".s:keyword
execute "hi Operator guifg=".s:keyword
execute "hi Keyword guifg=".s:keyword
execute "hi Exception guifg=".s:keyword
execute "hi PreProc guifg=".s:keyword
execute "hi Include guifg=".s:keyword
execute "hi Define guifg=".s:keyword
execute "hi Macro guifg=".s:keyword
execute "hi PreCondit guifg=".s:keyword
execute "hi Type guifg=".s:type
execute "hi StorageClass guifg=".s:keyword
execute "hi Structure guifg=".s:type
execute "hi Typedef guifg=".s:type
execute "hi Special guifg=".s:special
execute "hi SpecialChar guifg=".s:special
execute "hi Tag guifg=".s:attr
execute "hi Delimiter guifg=".s:special
execute "hi SpecialComment guifg=".s:comment
execute "hi Debug guifg=".s:warning
execute "hi WildMenu guifg=".s:fg." guibg=".s:bg
execute "hi NormalFloat guifg=".s:fg." guibg=".s:visual

" TypeScript specific
execute "hi typescriptBraces guifg=".s:special
execute "hi typescriptParens guifg=".s:special
execute "hi typescriptEndColons guifg=".s:special
execute "hi typescriptModule guifg=".s:keyword
execute "hi typescriptImport guifg=".s:keyword
execute "hi typescriptExport guifg=".s:keyword
execute "hi typescriptVariable guifg=".s:keyword
execute "hi typescriptOperator guifg=".s:keyword
execute "hi typescriptEnumKeyword guifg=".s:keyword
execute "hi typescriptArrowFunc guifg=".s:keyword
execute "hi typescriptMethodAccessor guifg=".s:keyword
execute "hi typescriptAsyncFuncKeyword guifg=".s:keyword
execute "hi typescriptAwaitKeyword guifg=".s:keyword
execute "hi typescriptCall guifg=".s:special
execute "hi typescriptClassName guifg=".s:function
execute "hi typescriptClassHeritage guifg=".s:function
execute "hi typescriptInterfaceName guifg=".s:function
execute "hi typescriptTypeReference guifg=".s:function
execute "hi typescriptFuncName guifg=".s:function
execute "hi typescriptMember guifg=".s:function
execute "hi typescriptObjectLabel guifg=".s:fg

" TSX/JSX Support
execute "hi tsxAttrib guifg=".s:attr
execute "hi tsxTag guifg=".s:special
execute "hi tsxTagName guifg=".s:function
execute "hi tsxCloseTag guifg=".s:special
execute "hi tsxCloseString guifg=".s:special
execute "hi tsxAttributeBraces guifg=".s:special
execute "hi tsxEqual guifg=".s:special
execute "hi tsxString guifg=".s:fg

" HTML
execute "hi htmlTag guifg=".s:special
execute "hi htmlEndTag guifg=".s:special
execute "hi htmlTagName guifg=".s:function
execute "hi htmlArg guifg=".s:attr
execute "hi htmlTitle guifg=".s:fg

" CSS
execute "hi cssClassName guifg=".s:function
execute "hi cssIdentifier guifg=".s:function
execute "hi cssTagName guifg=".s:function
execute "hi cssColor guifg=".s:constant
execute "hi cssBraces guifg=".s:special
execute "hi cssAttr guifg=".s:attr
execute "hi cssAttrRegion guifg=".s:attr
execute "hi cssDefinition guifg=".s:attr
execute "hi cssVendor guifg=".s:attr
execute "hi cssImportant guifg=".s:attr

" JavaScript
execute "hi javaScript guifg=".s:fg
execute "hi javaScriptBraces guifg=".s:special
execute "hi javaScriptNumber guifg=".s:constant
execute "hi javaScriptNull guifg=".s:constant
execute "hi javaScriptIdentifier guifg=".s:keyword
execute "hi javaScriptOperator guifg=".s:keyword
execute "hi javaScriptFunction guifg=".s:keyword
execute "hi javaScriptRegexpString guifg=".s:string
execute "hi javaScriptGlobal guifg=".s:type
execute "hi javaScriptMessage guifg=".s:type
execute "hi javaScriptThis guifg=".s:special

" Python
execute "hi pythonBuiltin guifg=".s:function." gui=bold"
execute "hi pythonStatement guifg=".s:keyword
execute "hi pythonConditional guifg=".s:keyword
execute "hi pythonRepeat guifg=".s:keyword
execute "hi pythonException guifg=".s:keyword
execute "hi pythonInclude guifg=".s:keyword
execute "hi pythonDecorator guifg=".s:attr
execute "hi pythonFunction guifg=".s:function
execute "hi pythonClass guifg=".s:function
execute "hi pythonOperator guifg=".s:keyword
execute "hi pythonSelf guifg=".s:special
execute "hi pythonDottedName guifg=".s:special
execute "hi pythonComment guifg=".s:comment." gui=italic"
execute "hi pythonDocstring guifg=".s:comment." gui=italic"
execute "hi pythonString guifg=".s:string
execute "hi pythonQuotes guifg=".s:string
execute "hi pythonTripleQuotes guifg=".s:string

" Markdown
execute "hi markdownHeadingDelimiter guifg=".s:function." gui=bold"
execute "hi markdownH1 guifg=".s:function." gui=bold"
execute "hi markdownH2 guifg=".s:function." gui=bold"
execute "hi markdownH3 guifg=".s:function." gui=bold"
execute "hi markdownH4 guifg=".s:function." gui=bold"
execute "hi markdownH5 guifg=".s:function." gui=bold"
execute "hi markdownH6 guifg=".s:function." gui=bold"
execute "hi markdownCode guifg=".s:special
execute "hi markdownCodeBlock guifg=".s:special
execute "hi markdownCodeDelimiter guifg=".s:special
execute "hi markdownBlockquote guifg=".s:comment
execute "hi markdownListMarker guifg=".s:function
execute "hi markdownOrderedListMarker guifg=".s:function
execute "hi markdownRule guifg=".s:special
execute "hi markdownHeadingRule guifg=".s:special
execute "hi markdownUrlDelimiter guifg=".s:special
execute "hi markdownLinkDelimiter guifg=".s:special
execute "hi markdownLinkTextDelimiter guifg=".s:special
execute "hi markdownHeadingDelimiter guifg=".s:special
execute "hi markdownUrl guifg=".s:link
execute "hi markdownUrlTitleDelimiter guifg=".s:string
execute "hi markdownLinkText guifg=".s:function." gui=underline"
execute "hi markdownIdDeclaration guifg=".s:function

" JSON
execute "hi jsonKeyword guifg=".s:function
execute "hi jsonString guifg=".s:string
execute "hi jsonBoolean guifg=".s:constant
execute "hi jsonNumber guifg=".s:constant
execute "hi jsonQuote guifg=".s:special
execute "hi jsonBraces guifg=".s:special
execute "hi jsonNull guifg=".s:constant

" TreeSitter support (for Neovim)
if has("nvim")
  " Identifiers
  execute "hi! link @variable guifg=".s:fg
  execute "hi! link @variable.builtin guifg=".s:special
  execute "hi! link @variable.parameter guifg=".s:special
  execute "hi! link @variable.member guifg=".s:fg
  execute "hi! link @constant guifg=".s:constant
  execute "hi! link @constant.builtin guifg=".s:special
  execute "hi! link @constant.macro guifg=".s:keyword
  execute "hi! link @module guifg=".s:function
  execute "hi! link @label guifg=".s:keyword
  execute "hi! link @symbol guifg=".s:special

  " Functions
  execute "hi! link @function guifg=".s:function
  execute "hi! link @function.builtin guifg=".s:special
  execute "hi! link @function.macro guifg=".s:keyword
  execute "hi! link @method guifg=".s:function
  execute "hi! link @constructor guifg=".s:function
  execute "hi! link @parameter guifg=".s:special

  " Keywords
  execute "hi! link @keyword guifg=".s:keyword
  execute "hi! link @keyword.function guifg=".s:keyword
  execute "hi! link @keyword.operator guifg=".s:keyword
  execute "hi! link @keyword.return guifg=".s:keyword
  execute "hi! link @conditional guifg=".s:keyword
  execute "hi! link @repeat guifg=".s:keyword
  execute "hi! link @debug guifg=".s:warning
  execute "hi! link @exception guifg=".s:keyword
  execute "hi! link @include guifg=".s:keyword
  execute "hi! link @define guifg=".s:keyword

  " Types
  execute "hi! link @type guifg=".s:type
  execute "hi! link @type.builtin guifg=".s:type
  execute "hi! link @type.qualifier guifg=".s:keyword
  execute "hi! link @type.definition guifg=".s:type
  execute "hi! link @storageclass guifg=".s:keyword
  execute "hi! link @namespace guifg=".s:fg
  execute "hi! link @attribute guifg=".s:special
  execute "hi! link @property guifg=".s:fg
  execute "hi! link @field guifg=".s:fg

  " Literals
  execute "hi! link @string guifg=".s:string
  execute "hi! link @string.regex guifg=".s:string
  execute "hi! link @string.escape guifg=".s:special
  execute "hi! link @string.special guifg=".s:special
  execute "hi! link @character guifg=".s:string
  execute "hi! link @character.special guifg=".s:special
  execute "hi! link @boolean guifg=".s:constant
  execute "hi! link @number guifg=".s:number
  execute "hi! link @float guifg=".s:number

  " Markup
  execute "hi! link @text.strong guifg=".s:fg
  execute "hi! link @text.emphasis guifg=".s:fg
  execute "hi! link @text.underline guifg=".s:fg
  execute "hi! link @text.strike guifg=".s:comment
  execute "hi! link @text.title guifg=".s:function
  execute "hi! link @text.literal guifg=".s:string
  execute "hi! link @text.uri guifg=".s:fg." gui=underline"
  execute "hi! link @text.reference guifg=".s:fg
  execute "hi! link @tag guifg=".s:special
  execute "hi! link @tag.attribute guifg=".s:keyword
  execute "hi! link @tag.delimiter guifg=".s:special

  " Comments
  execute "hi! link @comment guifg=".s:comment
  execute "hi! link @comment.documentation guifg=".s:comment

  " Punctuation
  execute "hi! link @punctuation.delimiter guifg=".s:special
  execute "hi! link @punctuation.bracket guifg=".s:special
  execute "hi! link @punctuation.special guifg=".s:special

  " Misc
  execute "hi! link @error guifg=".s:error
  execute "hi! link @danger guifg=".s:error
  execute "hi! link @todo guifg=".s:function." gui=italic"
endif

" Additional TypeScript/JavaScript specific highlights
execute "hi typescriptCall guifg=".s:fg
execute "hi typescriptBinaryOp guifg=".s:keyword
execute "hi typescriptUnaryOp guifg=".s:keyword
execute "hi typescriptAssign guifg=".s:keyword
execute "hi typescriptConstructSignature guifg=".s:keyword
execute "hi typescriptFuncType guifg=".s:special
execute "hi typescriptTemplateSubstitution guifg=".s:string
execute "hi typescriptTemplateSB guifg=".s:special
execute "hi typescriptTypeAnnotation guifg=".s:special
execute "hi typescriptTypeBrackets guifg=".s:special
execute "hi typescriptTypeParameter guifg=".s:function
execute "hi typescriptDecorator guifg=".s:attr

" String Literals in TypeScript/JavaScript
execute "hi typescriptStringLiteralType guifg=".s:attr
execute "hi typescriptStringProperty guifg=".s:attr
execute "hi typescriptObjectPropertyKey guifg=".s:attr
execute "hi typescriptTemplateLiteral guifg=".s:string
execute "hi typescriptString guifg=".s:string
execute "hi typescriptStringS guifg=".s:string
execute "hi typescriptStringD guifg=".s:string
execute "hi typescriptStringB guifg=".s:string

" Next.js Directives
execute "hi typescriptDirective guifg=".s:string
execute "hi javascriptDirective guifg=".s:string

" Import/Export Paths
execute "hi typescriptImportPath guifg=".s:fg
execute "hi typescriptExportPath guifg=".s:fg

" Done!
