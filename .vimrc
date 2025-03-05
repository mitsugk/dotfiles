" --------------------------------
" vim
" --------------------------------
filetype off
filetype plugin indent off 
syntax enable 

set nowrap
set autoindent
set ruler
set list
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set clipboard=unnamed
set nocompatible
" set mouse=a
" set number
set guioptions-=T
set nohlsearch
set cursorline
set laststatus=2
set statusline=%F%r%h%=
set showcmd
set incsearch
set ignorecase
set smartcase
set wildmenu wildmode=list:full

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

let mapleader = "\<Space>"
"nnoremap  <leader>l :call Flake8()

autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %

highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CursorLine gui=underline guifg=NONE guibg=NONE

highlight StatusLine guibg=White guifg=Black
highlight StatusLineNC guibg=Gray guifg=Black
augroup myStatusLine
  autocmd! ColorScheme * highlight StatusLine guibg=White guifg=Black
  autocmd! ColorScheme * highlight StatusLineNC guibg=Gray guifg=Black
augroup END

" --------------------------------
" dein.vim
" --------------------------------
if &compatible
  set nocompatible
endif
" set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " TOML for Plugin 
  let g:dein_dir  = expand('~/.vim/dein')
  let s:toml      = g:dein_dir . '/dein.toml'
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
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
      \ 'ruby', 'javascript','coffee', 'scss', 'html', 'haml', 'slim', 'sh',
      \ 'spec', 'vim', 'zsh', 'sass', 'eruby'] }

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_haskell_checkers = ["hlint"]
let g:syntastic_haskell_checkers = ["flake8"]

let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

" --------------------------------
" autopep8
" --------------------------------
function! Preserve(command)
  " Save the last search.
  let search = @/
  " Save the current cursor position.
  let cursor_position = getpos('.')
  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)
  " Execute the command.
  execute a:command
  " Restore the last search.
  let @/ = search
  " Restore the previous
  " window position.
  call setpos('.', window_position)
  normal! zt
  " Restore
  " the
  " previous
  " cursor
  " position.
  call setpos('.', cursor_position)
endfunction

function! Autopep8()
  call Preserve(':silent %!autopep8 -')
endfunction

autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

" --------------------------------
" indent guides
" --------------------------------
set tabstop=2 shiftwidth=2 expandtab
let g:indent_guides_guide_size = 1

" --------------------------------
" codex
" --------------------------------
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

