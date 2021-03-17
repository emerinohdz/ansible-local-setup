map! ^[OD ^[h
map! ^[OC ^[l
map! ^[OA ^[k
map! ^[OB ^[j
map! ^[OE questions
map! <F2> <Esc> <F2>
map! <F8> <Esc> <F8>
map! <F7> <Esc> <F7>
map! <F5> <Esc> <F5>
map! <F6> <Esc> <F6> 
set hlsearch
set modeline
set modelines=1
set encoding=utf-8
syn on
set mouse=a
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ttimeout
set shell=/bin/zsh
set expandtab
set number
set ruler
set autowrite
filetype on
"autocmd FileType java set compiler=maven2 <CR>
autocmd FileType C set makeprg=make <CR>
autocmd FileType python set expandtab
autocmd FileType tf set shiftwidth=2 tabstop=2 softtabstop=2 autoindent smarttab
autocmd FileType make set autoindent noexpandtab tabstop=4 shiftwidth=4
nmap <F9> :make <CR>
"nmap <F11> :set makeprg=javac\ *.java <CR>
"nmap <C-A> :cprev <CR>
nmap <C-S> :cnext <CR>
nmap <F8> :tabnext <CR>
nmap <F7> :tabprev <CR>
nmap <F5> :tabnew <CR>
nmap <F6> :tabedit 
nmap <F2> gg=G 
nmap <C-Z> :sh <CR>
map! <C-Z> :sh <CR>

nmap <C-Left> :tabprevious<cr>
nmap <C-Right> :tabnext<cr>
map <C-Left> :tabprevious<cr>
map <C-Right> :tabnext<cr>


" Cerrar automáticamente las llaves {}
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}

" Cerrar automáticamente los paréntesis (requiere vim >= 7.0)
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" less syntax
au BufNewFile,BufRead *.less set filetype=less

" Simple re-format for minified Javascript
"command! UnMinify call UnMinify()
"function! UnMinify()
"    %s/{\ze[^\r\n]/{\r/g
"    %s/){/) {/g
"    %s/};\?\ze[^\r\n]/\0\r/g
"    %s/;\ze[^\r\n]/;\r/g
"    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
"    normal ggVG=
"endfunction

autocmd FilterWritePre * if &diff | setlocal wrap< | endif
