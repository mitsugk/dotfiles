export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

stty stop undef
stty start undef

# backward history with peco
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

alias vi="vim"

[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`

[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local

