if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')

  " Add or remove your plugins here:
  " show full space or half space
  call dein#add('bronson/vim-trailing-whitespace')
  " toggle comment by twice ctrl+- or gc
  call dein#add('tomtom/tcomment_vim')
  " show indentation
  call dein#add('nathanaelkane/vim-indent-guides')
  " markdown
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Install plugins
if dein#check_install()
  call dein#install()
endif

" title
set title
" colorscheme
colorscheme elflord

" status bar
" right align from this
set statusline=%=
" readonly
set statusline+=%r
" encoding/line encoding
let ff_table = {'dos' : 'CR+LF', 'unix' : 'LF', 'mac' : 'CR'}
set statusline+=[%{(&fenc!=''?&fenc:&enc)}/%{ff_table[&ff]}]
" line number/total line
set statusline+=[%l/%L]
" completation at status line
set wildmenu wildmode=list:longest,full
" show status line always
set laststatus=2

" vim encoding
set encoding=utf-8
scriptencoding utf-8
" file encoding
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" cursor move
" move to line top or line end
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^i
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^i
" move to next line top beyond line end
set whichwrap=h,l
" in line wrap mode, move line by display line number
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" enable <back space>
set backspace=indent,eol,start

" move cursor into paren.
" imap {} {}<Left>
" imap [] []<Left>
" imap () ()<Left>
" imap "" ""<Left>
" imap '' ''<Left>
" imap <> <><Left>

" move cursor into center in search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

"" toggle paste mode
"set clipboard=unnamed
"set pastetoggle=<F3>
"" turn off paste mode when leaving insert mode
"autocmd InsertLeave * set nopaste

" split window
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" switch window
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w
" :close  -- close current window
" :qall :qa  -- close all window
" buffer
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
" :e <filename>  -- edit buffer
" :bd[elete]  -- delete buffer

" tab/indent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

" enable align format excluding comment
set formatoptions-=c

" hilight search word
set hlsearch
" incremental search
set incsearch
" ignore case
set ignorecase
set smartcase
" switch hilight by twice ESC
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" ruler
set ruler
" line number
set number
" hilight cursor line
" set nocursorline
set nocursorline
" hilight matched paren
set showmatch
:source $VIMRUNTIME/macros/matchit.vim
let b:match_words = "if:endif,foreach:endforeach,\<begin\>:\<end\>"
" hilight invisivle character
set list
set listchars=tab:»-,extends:»,precedes:«

" beep off
set visualbell t_vb=
set noerrorbells

" confirm to save file before close
set confirm
" autoload when edit file
set autoread
" don't create backup file
set nobackup
" don't create swap file
set noswapfile
" don't create undo file
set noundofile

" plugins config
" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=7
" markdown
let g:vim_markdown_folding_disabled = 1

