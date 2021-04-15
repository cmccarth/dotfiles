if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
    unset PROMPT_COMMAND
fi

set -o vi

# From https://github.com/mrzool/bash-sensible/blob/master/sensible.bash
bind Space:magic-space
bind "set show-all-if-ambiguous on"
bind "set mark-symlinked-directories on"
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND='history -a'
HISTSIZE=500000
HISTFILESIZE=100000
HISTCONTROL="erasedups:ignoreboth"
HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
HISTTIMEFORMAT="%F %T "

# So Perforce doesn't get confused...
shopt -u interactive_comments

export PATH="$HOME/bin:/usr/local/opt/gnu-getopt/bin:/usr/local/netbin:/usr/local/bin:/opt/local/bin:/hub/share/bin:$HOME/.gem/ruby/1.8/bin:/Applications/p4merge.app/Contents/MacOS:/usr/bin:/bin:/usr/sbin:/sbin:/mathworks/hub/share/apps/bat/stable/share/"
export MANPATH="${MANPATH}:/local/share/man:/usr/local/share/man"
export FLAGS_GETOPT_CMD="/usr/local/opt/gnu-getopt/bin/getopt"

export P4USER="cmccarth"
export PAGER="less -R"
export LC_COLLATE="C"
export LESS="-M"
export ORGANIZATION="MathWorks"
export CLICOLOR=YES
export GPG_TTY=`tty`

if [[ $(hostname) =~ korriban  ]]; then
    PROMPT_COLOR="31"
elif [[ $(hostname) =~ agathon ]]; then
    PROMPT_COLOR="34"
fi

export PS1="[\u@\[\e[1m\]\[\e[${PROMPT_COLOR}m\]\h\[\e[m\]:${OS_ENV}\w]\n\$ "

export P4CONFIG=.perforce
export P4MERGE=p4merge
export P4IGNORE=".p4ignore;$HOME/.p4ignore"

export EDITOR=$MYEDITOR
export P4EDITOR=$MYEDITOR
export VISUAL=$MYEDITOR

if [[ -f $HOME/.aliases ]]; then
    source $HOME/.aliases
fi

pathto()
{
    # http://unix.derkeiler.com/Newsgroups/comp.unix.programmer/2005-01/0195.html
    # make sure file is specified
    if [ -z "$1" ]
    then
        echo "$0 <path>"
        return 1
    fi
    # already absolute case
    if [ "${1:0:1}" = "/" ] || [ "$PWD" = "/" ]
    then
        ABS=""
    else
        ABS="$PWD"
    fi
    # loop thru path
    IFS="/"
    for DIR in $1
    do
        if [ -n "$DIR" ]
        then
            if [ "$DIR" = ".." ]
            then
                ABS="${ABS%/*}"
            elif [ "$DIR" != "." ]
            then
                ABS="$ABS/$DIR"
            fi
        fi
    done
    IFS=":"
    echo $ABS
    return 0
}

gf()
{
    docker run --rm -it -v "$1:/$1" guestfs --rw --add "/$1"
}

title()
{
    echo -ne "\033]0;"$*"\007"
}

if [[ $(uname -s) != Darwin ]]; then
    export LS_OPTIONS="--color=auto"
    eval "`dircolors`"
    alias ls="ls $LS_OPTIONS"
    . $HOME/bin/ssh-find-agent.sh
    ssh-find-agent -a
    if [ -z "$SSH_AUTH_SOCK" ]; then
        eval $(ssh-agent -s)
        ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
    fi
fi

export PYENV_ROOT=$HOME/.pyenv

if [[ -d $PYENV_ROOT ]]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
