export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

stty stop undef
stty start undef

alias vi="vim"

[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`

[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local

