if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/kitano/.vim/dein/repos/github.com/Shougo/dein.vim/,/home/kitano/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/kitano/.vim/after,/home/kitano/.vim/' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/kitano/.vimrc', '/home/kitano/.vim/dein/dein.toml', '/home/kitano/.vim/dein/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/kitano/.vim/dein'
let g:dein#_runtime_path = '/home/kitano/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/kitano/.vim/dein/.cache/.vimrc'
let &runtimepath = '/home/kitano/.vim/dein/repos/github.com/Shougo/dein.vim/,/home/kitano/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/home/kitano/.vim/dein/repos/github.com/Shougo/dein.vim,/home/kitano/.vim/dein/repos/github.com/Shougo/vimproc,/home/kitano/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vim80,/home/kitano/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/kitano/.vim/after,/home/kitano/.vim/'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neosnippet.vim'])
