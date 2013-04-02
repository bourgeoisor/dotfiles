" Vim syntax file
" Finiks Custom Notes
" Maintainer: Olivier Bourgeois
" Latest Revision: 14 March 2013

if exists("b:current_syntax")
    finish
endif

syn spell default

syn match fnksKeyGreen  ">"
syn match fnksKeyGreen  "Done."     contained
syn match fnksKeyGreen  "C"         contained
syn match fnksKeyBlue   "P"         contained
syn match fnksKeyRed    "S"         contained
syn match fnksKeyOrange "U"         contained

syn match fnksURL       "http[^ ]*" 
syn match fnksComment   "\*.*"      skipwhite
syn match fnksNumber    "\d\+"      contained
syn match fnksNumber    "\d\+\."     
syn match fnksSlash     "/"         contained
syn match fnksString    ".*)"        contained
syn match fnksMinus     "[^ ]* ::[^ ]*"    

syn region fnksBracketBlock oneline start="\[" end="\]" transparent contains=fnksNumber,fnksSlash,fnksKeyGreen,fnksKeyBlue,fnksKeyRed,fnksKeyOrange
syn region fnksParenthesis oneline start="(" end=")" transparent contains=fnksString

let b:current_syntax = "fnks"

hi def link fnksKeyGreen    Special
hi def link fnksKeyBlue     Underlined
hi def link fnksKeyRed      Constant
hi def link fnksKeyOrange   Type
hi def link fnksURL         Statement
hi def link fnksComment     Comment
hi def link fnksNumber      Underlined
hi def link fnksSlash       Comment
hi def link fnksstring      Comment
hi def link fnksMinus       Constant

" Comment       = grey
" Constant      = red
" Error         = red underlined
" Function      = yellow
" Type          = orange
" Statement     = pale blue
" Underlined    = blue
" Todo          = pale green
" Special       = green
" Identifier    = purple
