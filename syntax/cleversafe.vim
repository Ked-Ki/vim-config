" Vim syntax file
" Language: Cleversafe Logs

" TODO Figure out how to make this less ugly

if exists("b:current_syntax")
  finish
endif

syn match log4jInfo '^\d\{4}-\d\d-\d\d \d\d:\d\d:\d\d.\d\{3}\%({.\{-}}\)\=\s\(\(DEBUG\)\|\(INFO\)\|\(WARN\)\|\(ERROR\)\)\(\s\+\[.\{-}\]\)\=\(\s\+{.\{-}}\)\=\(\s\+\w\+\.\w\+\(\.\w\+\)\+\)\='

syn keyword logType DEBUG INFO containedin=log4jInfo contained
syn keyword warnLogType WARN containedin=log4jInfo contained
syn keyword errorLogType ERROR containedin=log4jInfo contained

syn match date '^\d\{4}-\d\d-\d\d \d\d:\d\d:\d\d.\d\{3}' containedin=log4jInfo contained display
syn match thread '\[.\{-}\]' containedin=log4jInfo contained display
syn match event '{.\{-}}' containedin=log4jInfo contained display
syn match className '\w\+\.\w\+\(\.\w\+\)\+\(\$\w\+\)\?' containedin=log4jInfo contained display

syn match ipaddr '\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\(:\d\+\)\='

syn match sourceName '<\(Source\|Slice\)Name\( index=\d*,\)\? vault=.\{8}-.\{4}-.\{4}-.\{4}-.\{12}, type=\d*, generation=\d*, storage=.\{48}>'

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508 
    let did_cpp_syntax_inits = 1 
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink logType        Keyword
  HiLink warnLogType    MatchParen
  HiLink errorLogType   Error
  HiLink date           Type
  HiLink thread         Function
  HiLink event          Delimiter
  HiLink className      Boolean
  HiLink ipaddr         PreProc
  HiLink sourceName     PreProc
  delcommand HiLink
endif

let b:current_syntax = "cleversafe"
