syntax on
set title
set ruler
set backspace=indent,eol,start
"/usr/share/vim/vim*/colors
colorscheme default
" Dark Pastels
set background=dark

" Show a window number in window splits (for use with CTRL-W <num>w)
set statusline=%{winnr()}
set statusline+=\ 
set statusline+=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

set autoread

set number
set modeline
set colorcolumn=80
highlight ColorColumn ctermbg=0

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

" Automatically load cscope.out DB, if it exists
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au BufEnter /* call LoadCscope()

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

" Modify the appearance of the tab line (tab labels)
if exists("+showtabline")
     function MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             "let s .= ' '
             "let s .= i . ':'
             "let s .= ' %*'
             let s .= '%*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let s .= '[ '. i . ':'
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
	     let s .= ' ]'
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif
