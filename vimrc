syntax on
set title
set ruler
set backspace=indent,eol,start
set background=dark

set number
set modeline
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set hlsearch
hi Search ctermfg=black

" Matching paren highlight
hi MatchParen ctermfg=black
let loaded_matchparen = 1

set cino+=(0
set cino+=:0

let c_space_errors = 1
let python_space_errors = 1

set tags=./tags;/;../tags

let g:ctags_statusline = 1
let generate_tags = 1
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " ...
endif

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Put new window on right of horizontal split
set splitright

" Put new window below existing in vertical split
set splitbelow

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

set completeopt-=preview
