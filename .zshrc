# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

plugins=(git ruby gem)

<<<<<<< HEAD
# User configuration

export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# export MANPATH="/usr/local/man:$MANPATH"
=======
>>>>>>> 90ab9f9fb113f643dd5eaa89f989662ac57b364f

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

stty stop undef
stty start undef

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

alias e='emacsclient -nw -a ""'
alias emacs='emacsclient -nw -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'

# Python Settings
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
