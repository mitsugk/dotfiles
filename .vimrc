filetype plugin indent on 

" シンタックスハイライト有効化
syntax on

set nowrap
set autoindent

set ruler
set list

" <TAB>を含むファイルを開いた際、<TAB>を何文字の空白に変換するかを設定
set tabstop=4
" キーボードで<TAB>を入力した際、<TAB>を何文字の空白に変換するかを設定
set softtabstop=4
" vimが自動でインデントを行った際、設定する空白数
set shiftwidth=4
set expandtab
set smarttab

set clipboard=unnamed

set nocompatible

" マウス機能有効化
" set mouse=a

set nohlsearch " 検索キーワードをハイライトしないように設定
set cursorline " カーソルラインの強調表示を有効化
" アンダーラインを引く(color terminal)
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" アンダーラインを引く(gui)
highlight CursorLine gui=underline guifg=NONE guibg=NONE


" 行番号を表示
" set number
" ステータスラインを表示
set laststatus=2 " ステータスラインを常に表示
set statusline=%F%r%h%= " ステータスラインの内容
set showcmd "入力中のコマンドを表示
highlight StatusLine guibg=White guifg=Black
highlight StatusLineNC guibg=Gray guifg=Black
augroup myStatusLine
    autocmd! ColorScheme * highlight StatusLine guibg=White guifg=Black
    autocmd! ColorScheme * highlight StatusLineNC guibg=Gray guifg=Black
augroup END

" インクリメンタル検索を有効化
set incsearch
set ignorecase "検索時の大文字小文字を無視
set smartcase  "大文字検索時のみ小文字を区別

" 補完時の一覧表示機能有効化
set wildmenu wildmode=list:full

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

filetype off
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))
endif 

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'

call neobundle#end()

let g:solarized_termtrans=1
colorscheme solarized
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

filetype plugin indent on

