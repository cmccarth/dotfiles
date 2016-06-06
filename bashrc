if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
    unset PROMPT_COMMAND
fi

set -o vi

# So Perforce doesn't get confused...
shopt -u interactive_comments

export PATH="$HOME/.pyenv/bin:$HOME/bin:/usr/local/netbin:/usr/local/bin:/opt/local/bin:/hub/share/bin:$HOME/.gem/ruby/1.8/bin:/Applications/p4merge.app/Contents/MacOS:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="${MANPATH}:/local/share/man:/usr/local/share/man"

export P4USER="cmccarth"
export PAGER="less -R"
export LC_COLLATE="C"
export LESS="-M"
export ORGANIZATION="MathWorks"
export CLICOLOR=YES
export GPG_TTY=`tty`

export PS1='[\u@\[\e[1m\]\h\[\e[m\]:\w]\n\$ '
export HISTIGNORE="&:c:clear:exit:cd ..:cd -"
export HISTTIMEFORMAT="%F %T "
export P4CONFIG=.perforce
export P4MERGE=p4merge
export P4IGNORE=".p4ignore;$HOME/.p4ignore"

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

export EDITOR=$MYEDITOR
export P4EDITOR=$MYEDITOR
export VISUAL=$MYEDITOR

alias dnsq="host -t axfr mathworks.com | grep -i "
alias c="clear"
alias dhcphost="host -l dhcp.mathworks.com | grep -i "
alias bsem="ssh -x root@bsemaster"
alias deb7="ssh -x cmccarth@cmccarth2-deb7-64"
alias aga="ssh -x chris@agathon.dhcp.mathworks.com"
alias p4dir="cd /mathworks/devel/sandbox/cmccarth/scm/perforce"
alias gitdir="cd /mathworks/devel/sandbox/cmccarth/scm/git"
alias tm="tmux attach-session -t main"
alias tmp4="tmux attach-session -t p4"
alias os="openstack"

if [[ -e $HOME/.ssh/ssh_command_only_config ]]; then
    alias ssh="ssh -F $HOME/.ssh/ssh_command_only_config"
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

cleanssh()
{
    ssh-keygen -R $1
}

pp4() {
    if [[ $P4EDITOR = "subl -w" ]]; then
        PP4EDITOR="subl"
    else
        PP4EDITOR="$P4EDITOR"
    fi
    p4 edit $1 && $PP4EDITOR $1
}

if [[ $(uname -s) != Darwin ]]; then
    export LS_OPTIONS="--color=auto"
    eval "`dircolors`"
    alias ls="ls $LS_OPTIONS"
    if [[ $(hostname) =~ cmccarth[0-9]?-deb7-64  ]]; then
        . $HOME/bin/ssh-find-agent.sh
        ssh-find-agent -a
        if [ -z "$SSH_AUTH_SOCK" ]; then
            eval $(ssh-agent -s)
            ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
        fi
    fi
else
    HISTORY_LOG_DIR="$HOME/Dropbox/Logs/bash-history"
    if [[ -d $HISTORY_LOG_DIR ]]; then
        export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then if [[ `history 1 | cut -f 3 -d " "` -ne 500 ]]; then echo "$(hostname -s):$(pwd) $(history 1)" >> ${HISTORY_LOG_DIR}/bash-history-$(date "+%Y-%m-%d").log; fi; fi'
    fi
fi
