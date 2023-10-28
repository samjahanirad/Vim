:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set mouse=a
:set clipboard=unnamed
:set termguicolors
:set scrolloff=10

syntax on

filetype on
filetype indent on 

inoremap { {}<left>
inoremap {<CR> {<CR>}<Esc>O
inoremap { {
inoremap {} {}
map <C-a> <Esc>ggVGy<CR>

autocmd BufNewFile *.cpp 0r /home/user/cp/template.cpp
autocmd filetype cpp nnoremap <F9> :w <bar> !clear && g++ -o %:r.exe<CR>
autocmd filetype cpp nnoremap <F10> :!./%:r.exe<CR>

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

call plug#begin()
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'neoclide/coc.nvim'
	Plug 'preservim/nerdtree'
	Plug 'jiangmiao/auto-pairs'

	"C#	
	Plug 'OmniSharp/omnisharp-vim'

	":Command
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

	call plug#end()

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()



let g:airline_powerline_fonts=1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#tabline#show_close_button=0

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"ShortCut

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

nnoremap <c-z> :u<CR>     
inoremap <c-z> <c-o>:u<CR>

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"Command 

command! -nargs=* Runcpp !g++ % -o /tmp/a.out && /tmp/a.out <args>


"OmniSharp
" Use the stdio version of OmniSharp-roslyn - this is the default
let g:OmniSharp_server_stdio = 1

" Use the HTTP version of OmniSharp-roslyn:
let g:OmniSharp_server_stdio = 0




" activate visual mode in normal mode
nmap <S-Up> V
nmap <S-Down> V
" these are mapped in visual mode
vmap <S-Up> k
vmap <S-Down> j
"Copy with v-shift
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui

