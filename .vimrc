filetype off
filetype plugin indent off 
syntax enable 

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

" ツールバー非表示
set guioptions-=T

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

" dein.vim
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  " TOML for Plugin 
  let g:dein_dir = expand('~/.vim/dein')
  let s:toml = g:dein_dir . '/dein.toml'
  let s:lazy_toml = g:dein_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" --------------------------------
" syntastic
" --------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
  \ 'ruby', 'javascript','coffee', 'scss', 'html', 'haml', 'slim', 'sh',
  \ 'spec', 'vim', 'zsh', 'sass', 'eruby'] }

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_ruby_checkers = ['rubocop']

let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let g:syntastic_haskell_checkers = ["hlint"]

" codex
set tags=tags;/,codex.tags;/

" tagbar for Haskell
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

filetype plugin indent on

