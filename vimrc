set nocompatible

syntax on  "syntax highlighting
set relativenumber  "Enables line numbering

set wrap
set textwidth=80

" tabs and indenting
set autoindent  "indent new lines
set tabstop=4 "number of visual spaces per tab
set softtabstop=4  "How much space Vim gives to a tab while editing
set expandtab "Makes tabs into spaces
set smarttab  "Improves tabbing
set shiftwidth=4  "Assists code formatting

" ui changes
"set cursorline
set wildmenu
set lazyredraw "don't redraw during macros

" simple input changes
" normal backspace
set backspace=indent,eol,start

" normal arrow keys
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

inoremap jj <esc>
cnoremap jj <esc>
vnoremap v <esc>

nnoremap <Space> @q

" Allow sudo saving without restarting vim
cmap w!! w !sudo tee > /dev/null %

" SML make code {{{
autocmd FileType sml setlocal makeprg=rlwrap\ sml\ '%'
autocmd FileType sml setlocal commentstring=(*\ %s\ *)
" }}}

" vim-latexsuite stuff {{{
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_ViewRule_pdf = "mupdf"
let g:Tex_PromptedEnvironments='problem,proof,subproblem,enumerate,itemize,description,equation*,align*,lstlisting'
let g:Tex_IgnoredWarnings =
            \'Underfull'."\n".
            \'Overfull'."\n".
            \'specifier changed to'."\n".
            \'You have requested'."\n".
            \'Missing number, treated as zero.'."\n".
            \'There were undefined references'."\n".
            \'LaTeX Font Warning:'."\n".
            \'Citation %.%# undefined'
let g:Tex_IgnoreLevel = 8
" }}}

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
