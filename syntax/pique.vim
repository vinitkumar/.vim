" Pique syntax file

if exists("b:current_syntax")
    finish
endif

syn match piqueComment "#.*$"
syn match piqueControl "\<\(for\|break\|continue\|return\|raise\)\>"
syn match piqueConditional "\<\(if\|else\|switch\|case\|default\|guard\|then\)\>"
syn match piqueImport "\<\(import\|import-as\|import-all\|export\|export-all\)\>"
syn match piqueFunction "\<\(def\|defmacro\)\>\s\+\(\S\+\)\>"
syn match piqueSupport "\<\(quote\|list\|form\|block\|let\|defvar\)\>"
syn match piqueLambda "\<\(lambda\)\>\s*:"
syn match piqueTest "^\s*\(test\|test-macro\)\>\s\+\(\"[^\"]\+\"\|\S\+\)"

syn match piqueVariable "\b\S\+\b"
syn match piqueStrayComma ","
syn match piqueOperators "\(:\|=\)"
syn match piqueNumbers "\<\(-\?[0-9]\+\.\?[0-9]*\)\>"
syn match piqueIntegers "\<\(-\?[0-9]\)\>"
syn match piqueConstants "\<\(true\|nil\|false\)\>"
syn match piqueConstants "\(\.\.\.\)"
syn match piqueConstants "\<\(inf\|-inf\|nan\)\>"

syn match piqueParens "(" contained nextgroup=piqueExpr skipwhite
syn match piqueParens ")" contained
syn match piqueBraces "{"
syn match piqueBraces "}"
syn region piqueString start=+"+ end=+"+ skip=+\\.+ contains=piqueEscape,piqueDString
syn region piqueString start=+'''+ end=+'''+ skip=+\\.'''+ contains=piqueEscape,piqueSString

syn match piqueEscape "\\[0-9]\+\\?"
syn match piqueEscape "\\."

highlight link piqueComment Comment
highlight link piqueControl Keyword
highlight link piqueConditional Keyword
highlight link piqueImport Keyword
highlight link piqueFunction Function
highlight link piqueSupport PreProc
highlight link piqueLambda Keyword
highlight link piqueTest Keyword
highlight link piqueVariable Identifier
highlight link piqueStrayComma Error
highlight link piqueOperators Operator
highlight link piqueNumbers Number
highlight link piqueIntegers Number
highlight link piqueConstants Constant
highlight link piqueParens Delimiter
highlight link piqueBraces Delimiter
highlight link piqueString String
highlight link piqueEscape SpecialChar

let b:current_syntax = "pique"

