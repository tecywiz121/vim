" Show line numbers
set number

" Vim Hardmode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Indentation Detection
let g:detectindent_preferred_indent = 4
let g:detectindent_preferred_expandtab = 1
autocmd BufReadPost * :DetectIndent

" Command completion
set wildchar=<Tab> wildmenu wildmode=longest,list

" Allow switching buffers without saving
set hidden

call pathogen#infect()

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

" Add LaTeX file types
let g:tex_flavor='latex'

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Smart indenting
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
inoremap # X#

au FileType xml,ant setlocal equalprg=xmllint\ --nocompact\ --format\ --recover\ -\ 2>/dev/null

" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
inoremap <Nul> <C-x><C-o>

set completeopt+=longest
set completeopt-=preview

nnoremap <leader>jd <Esc>:YcmCompleter GoTo<CR>

" Change <Enter> to select highlighted option
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" File Type overrides
au BufRead,BufNewFile *.s set filetype=nasm

" Window navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Set the title to the open file
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)
"if &term == "screen"
"    set t_ts=^[k
"    set t_fs=^[\
"endif
if &term == "screen" || &term == "xterm"
    set title
endif


" Switch to c++11
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" YouCompleteMe Configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" Highlight the background of long lines
highlight ColorColumn ctermbg=5 guibg=LightBlue
let &colorcolumn=80

" Fix vaxe autocompletion
autocmd FileType haxe set autowrite
