# Completion for zsh
autoload -Uz compinit && compinit

# 補完候補を一覧表示
setopt auto_list
# TABで補完候補を切り替え
setopt auto_menu
# 補完候補の色づけ
zstyle ':completion:*:default' menu select=1 

# cdコマンド不要で移動
setopt auto_cd

export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history

export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

stty stop undef
stty start undef

alias vi="vim"

[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`

[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local

