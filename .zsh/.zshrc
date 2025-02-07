# zsh setting
export LANG=ja_JP.UTF-8
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

## completion
autoload -Uz compinit && compinit
setopt auto_list
setopt auto_menu
setopt auto_cd
zstyle ':completion:*:default' menu select=1 

## disable Ctrl+S
stty stop undef
## disable Ctrl+Q
stty start undef

## history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history

## alias
alias vi="vim"
alias e='emacsclient -nw -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'

# zplug setting
if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
#zplug "b4b4r07/enhancd", use:init.sh
#zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
#zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
#zplug "motemen/ghq", as:command, from:gh-r
zplug "mollifier/anyframe"
zplug 'agnoster/agnoster-zsh-theme', as:theme
zplug "chrissicool/zsh-256color"
#zplug 'wesbos/cobalt2', as:theme
#zplug "mafredri/zsh-async"
#zplug "sindresorhus/pure"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# Ctrl+R with peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# OS specific setting
[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`

# local specific setting
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
