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

export PATH="$HOME/bin:/usr/local/netbin:/usr/local/bin:/opt/local/bin:/hub/share/bin:$HOME/.gem/ruby/1.8/bin:/Applications/p4merge.app/Contents/MacOS:/usr/bin:/bin:/usr/sbin:/sbin:/mathworks/hub/share/apps/bat/stable/share/"
export MANPATH="${MANPATH}:/local/share/man:/usr/local/share/man"

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

alias dnsq="host -t axfr mathworks.com | grep -i "
alias c="clear"
alias dhcphost="host -l dhcp.mathworks.com | grep -i "
alias bsem="ssh -x root@bsemaster"
alias deb9="ssh -x cmccarth@cmccarth-deb9-64.mathworks.com"
alias aga="ssh -x chris@agathon.mathworks.com"
alias p4dir="cd /mathworks/devel/sandbox/cmccarth/scm/perforce"
alias gitdir="cd /mathworks/devel/sandbox/cmccarth/scm/git"
alias os="docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cloud/openstack-client --os-cloud"
alias gla="docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cmccarth/glance-client"
alias nov="docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cmccarth/nova-client"
alias cleanssh='ssh-keygen -R $(history -p !$)'
alias dynastat='ssh -l root -t dynapro tmuxinator start dynastat'
alias p='bm bat-pool'
alias lin='ssh -l root -i ~/.ssh/linode20171122 li1272-155.members.linode.com'
#alias ka='docker run --rm -it -v ~/git/kolla-ansible:/kolla-ansible -v ~/git/kolla-config:/etc/kolla -v ~/.ssh/ka:/root/.ssh cmccarth/kolla-ansible /bin/bash'
alias ka='docker run --rm -it -v ~/git/kolla-ansible:/kolla-ansible -v ~/git/kolla-config:/etc/kolla -v ~/.ssh/ka:/root/.ssh docker.bserepo.mathworks.com/cmccarth/kolla-ansible-exec'
alias ap='docker run --rm -it -v "${PWD}:/playbook" -v "${HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/ansible-base ansible-playbook'
alias ans='docker run --rm -it -v "${PWD}:/playbook" -v "${HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/ansible-base ansible'
alias ansv='docker run --rm -it -v "${PWD}:/playbook" -v "${HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/ansible-base ansible-vault'
alias kk=kubectl

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
