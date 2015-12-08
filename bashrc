if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
	unset PROMPT_COMMAND
fi

set -o vi

# So Perforce doesn't get confused...
shopt -u interactive_comments

export PATH="$HOME/bin:/usr/local/netbin:/usr/local/bin:/opt/local/bin:/hub/share/bin:$HOME/.gem/ruby/1.8/bin:/Applications/p4merge.app/Contents/MacOS:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="${MANPATH}:/local/share/man:/usr/local/share/man"

export P4USER="cmccarth"
export PAGER="less"
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

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

export EDITOR=$MYEDITOR
export P4EDITOR=$MYEDITOR
export VISUAL=$MYEDITOR

alias dnsq="host -t axfr mathworks.com | grep -i "
alias c="clear"
alias dhcphost="host -l dhcp.mathworks.com | grep -i "
alias bsem="ssh -x root@bsemaster"
alias deb7="ssh -x cmccarth@cmccarth2-deb7-64"
alias p4dir="cd /mathworks/devel/sandbox/cmccarth/scm/perforce"
alias gitdir="cd /mathworks/devel/sandbox/cmccarth/scm/git"
alias tm="tmux attach-session -t main"
alias tmp4="tmux attach-session -t p4"
alias os="openstack"

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

ssh-find-agent.bash -a
if [ -z "$SSH_AUTH_SOCK" ]
then
   eval $(ssh_agent) > /dev/null
   ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
fi
