# ZSH GIT PROMPT
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "woefe/git-prompt.zsh"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    zplug install
fi
zplug load 

export MOSH_TITLE_NOPREFIX=1

# HISTORIAL
HISTSIZE=3000
SAVEHIST=3000
HISTFILE=~/.history
setopt sharehistory

# ALIAS PARA DIRECTORIOS, SE PUEDE LLAMAR CON 'cd ~$NAMEDIR'
setopt autonamedirs

# NO BEEP!!!
setopt nobeep

setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup

setopt correct

zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# PERMITIMOS SELECCIONAR CON UN MENU LAS APLICACIONES A TERMINAR CON 'kill'
#zstyle ':completion:*:*:kill:*' verbose yes
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

autoload -Uz compinit
compinit 

typeset -g -A key

typeset -U path
path=(/usr/local/opt/mysql-client/bin /usr/local/sbin /opt/local/bin /opt/local/sbin $path[@])

# REHASH
zstyle ':completion:*' rehash yes

DIRSTACKSIZE=10
setopt  autopushd   pushdminus pushdsilent pushdtohome


# HISTORIAL DE DIRECTORIOS, PARA VER CON 'dh'
alias dh="dirs -v"
alias ls='ls -G'
alias vi="vim"
alias top="htop"
alias grep="grep --color=auto"
#alias less="less -r"
alias hgc='cat ~/.history | grep'
#alias top="top"
# on macOS zcat always appends .Z extension, better use gunzip
alias zcat='gunzip -c'

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
# key bindings
bindkey -v
#bindkey  "${key[Home]}"    beginning-of-line
#bindkey  "${key[End]}"     end-of-line
#bindkey  "${key[Insert]}"  overwrite-mode
#bindkey  "${key[Delete]}"  delete-char
#bindkey  "${key[Up]}"      up-line-or-search
#bindkey  "${key[Down]}"    down-line-or-search
#bindkey  "${key[Left]}"    backward-char
#bindkey  "${key[Right]}"   forward-char
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 

bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char 
bindkey '^P' push-line 

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
	    echoti smkx
}
function zle-line-finish () {
	    echoti rmkx
}
#zle -N zle-line-init
#zle -N zle-line-finish  

autoload -U colors
colors

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export red=$'%{\e[0;31m%}'
export RED=$'%{\e[1;31m%}'
export green=$'%{\e[0;32m%}'
export GREEN=$'%{\e[1;32m%}'
export blue=$'%{\e[0;34m%}'
export BLUE=$'%{\e[1;34m%}'
export purple=$'%{\e[0;35m%}'
export PURPLE=$'%{\e[1;35m%}'
export cyan=$'%{\e[0;36m%}'
export CYAN=$'%{\e[1;36m}'
export WHITE=$'%{\e[1;37m}'
export white=$'%{\e[0;37m}'
export NC=$'%{\e[0m%}'
export yellow=$'%{\e[0;33m%}'
export YELLOW=$'%{\e[1;33m%}'

PROMPT='${YELLOW}%n ${purple}at ${YELLOW}%m ${purple}in ${cyan}%~ 
$(gitprompt)${purple}> '
RPROMPT=" ${NC}%B[%T]%b"

#bindkey '^R' history-incremental-search-backward

function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi
