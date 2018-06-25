if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/mitsugk/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/mitsugk/.vim/after,/home/mitsugk/.vim/,/home/mitsugk/.vim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/mitsugk/.vimrc', '/home/mitsugk/.vim/dein/dein.toml', '/home/mitsugk/.vim/dein/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/mitsugk/.vim/dein'
let g:dein#_runtime_path = '/home/mitsugk/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/mitsugk/.vim/dein/.cache/.vimrc'
let &runtimepath = '/home/mitsugk/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/home/mitsugk/.vim/dein/repos/github.com/Shougo/dein.vim,/home/mitsugk/.vim/dein/repos/github.com/Shougo/vimproc,/home/mitsugk/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vim80,/home/mitsugk/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/mitsugk/.vim/after,/home/mitsugk/.vim/'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neosnippet.vim'])
