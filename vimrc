set nocompatible 

filetype plugin indent on "needed for vim-addon-manager

syntax on  "syntax highlighting
set relativenumber  "Enables line numbering

set textwidth=100

" tabs and indenting
set autoindent  "indent new lines
set tabstop=2 "number of visual spaces per tab
set softtabstop=2  "How much space Vim gives to a tab while editing
set expandtab "Makes tabs into spaces
set smarttab  "Improves tabbing
set shiftwidth=2  "Assists code formatting

" ui changes
set ruler
set t_Co=256

"set cursorline
set wildmenu
set lazyredraw " don't redraw during macros

" simple input changes
" normal backspace
set backspace=indent,eol,start

" mouse
set mouse=a

" search
set hlsearch
set ignorecase
set smartcase

" splits
set splitbelow
set splitright

" fuck normal arrow keys
nnoremap <silent> <Right> zL
nnoremap <silent> <Left> zH
nnoremap <silent> S-<Right> 10zl
nnoremap <silent> S-<Left> 10zh
nnoremap <silent> <Up> :bn<cr>
nnoremap <silent> <Down> :bp<cr>

inoremap jj <esc>
cnoremap jj <esc>
vnoremap v <esc>

nnoremap <Space> @q

nnoremap <silent> <Leader>S :set wrap!<CR>

nnoremap <leader>p :set invpaste<CR>

" Allow sudo saving without restarting vim
cmap w!! w !sudo tee > /dev/null %

" buffer switching
nnoremap <Leader>g :e#<CR>

" open vimrc
command Vimrc e $MYVIMRC
" open notes
command LabNotes e ~/lab_notes.md

" follow markdown style web links
nnoremap <leader>] yi(:!open <C-R>"<CR><CR>
nnoremap <leader>} yi(:e <C-R>"<CR>

" netrw (file browsing)
let g:netrw_liststyle = 3 " tree-style view
let g:netrw_banner = 0 " no banner
let g:netrw_browse_split = 4 " open file in previous window
let g:netrw_winsize = 30

" source addons config
execute "source "."/".join(split($MYVIMRC, "/")[0:-2], "/")."/"."vim-addon-manager.vimrc"
execute "source "."/".join(split($MYVIMRC, "/")[0:-2], "/")."/"."coc.vimrc"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'night_owl'

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

filetype plugin on
helptags $HOME/.vim/doc/

" stuff just for mac
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    set clipboard=unnamed
  endif
endif
