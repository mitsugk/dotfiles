if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/mitsugk/.vim/dein/repos/github.com/Shougo/dein.vim/,/Users/mitsugk/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/Users/mitsugk/.vim/after,/Users/mitsugk/.vim/' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/mitsugk/.vimrc', '/Users/mitsugk/.vim/dein/dein.toml', '/Users/mitsugk/.vim/dein/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/mitsugk/.vim/dein'
let g:dein#_runtime_path = '/Users/mitsugk/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/mitsugk/.vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/mitsugk/.vim/dein/repos/github.com/Shougo/dein.vim/,/Users/mitsugk/.vim,/usr/share/vim/vimfiles,/Users/mitsugk/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/mitsugk/.vim/dein/repos/github.com/Shougo/vimproc,/Users/mitsugk/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vim80,/Users/mitsugk/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/Users/mitsugk/.vim/after,/Users/mitsugk/.vim/'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neosnippet.vim'])
