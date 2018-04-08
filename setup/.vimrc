" Plugin management
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/Command-T'
Plug 'mhinz/vim-janah'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-expand-region'
Plug 'mhinz/vim-startify'
Plug 'lrvick/Conque-Shell'

call plug#end()

" ####################
" # General Settings #
" ####################

set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11
set number
let g:airline_powerline_fonts = 1
filetype plugin on
syntax on

" Make the working dir the current file dir
autocmd BufEnter * lcd %:p:h

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()

"
" ######################
" # Syntastic Settings #
" ######################
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ##########################
" # YouCompleteMe Settings #
" ##########################
"set statusline+=%#warningmsg#
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_server_python_interpreter = '/usr/bin/python2'

" ###################
" # Custom commands #
" ###################
:command NT NERDTreeToggle
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>
map <F3> :NT <CR>
nnoremap <M-J> /\v^(\w+\s+)?\w+::\w+\(.*\)
nnoremap <M-K> ?\v^(\w+\s+)?\w+::\w+\(.*\)
autocmd BufEnter * if !argc() | :silent NERDTreeMirror | endif
let NERDTreeChDirMode=2

" #########
" # Theme #
" #########
syntax enable
autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
