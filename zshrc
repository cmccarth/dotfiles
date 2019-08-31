# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/bin:/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"


# Path to your oh-my-zsh installation.
export ZSH="/Users/chris/.oh-my-zsh"

ZSH_TMUX_AUTOSTART=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=$HOME/git/dotfiles/oh-my-zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    brew
    colored-man-pages
    colorize
    docker
    docker-compose
    docker-machine
    git
    history-substring-search
    kubectl
    man
    pip
    tmux
    vscode
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="${MANPATH}:/local/share/man:/usr/local/share/man"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='code -w'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias dnsq="host -t axfr mathworks.com | grep -i "
alias c="clear"
alias dhcphost="host -l dhcp.mathworks.com | grep -i "
alias bsem="ssh -x root@bsemaster"
alias deb9="ssh -x cmccarth@cmccarth-deb9-64.mathworks.com"
alias aga="ssh -x chris@agathon.mathworks.com"
alias p4dir="cd /mathworks/devel/sandbox/cmccarth/scm/perforce"
alias os="docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cloud/openstack-client --os-cloud"
alias gla="docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cmccarth/glance-client"
alias nov="docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cmccarth/nova-client"
alias cleanssh='ssh-keygen -R $(history -p !$)'
alias dynastat='ssh -l root -t dynapro tmuxinator start dynastat'
alias p='bm bat-pool'
alias lin='ssh -l root -i ~/.ssh/linode20171122 li1272-155.members.linode.com'
alias ka='docker run --rm -it -v ~/git/kolla-ansible:/kolla-ansible -v ~/git/kolla-config:/etc/kolla -v ~/.ssh/ka:/root/.ssh docker.bserepo.mathworks.com/cmccarth/kolla-ansible-exec'
alias ap='docker run --rm -it -v "${PWD}:/playbook" -v "${HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/ansible-base ansible-playbook'
alias ans='docker run --rm -it -v "${PWD}:/playbook" -v "${HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/ansible-base ansible'
alias ansv='docker run --rm -it -v "${PWD}:/playbook" -v "${HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/ansible-base ansible-vault'
alias kk=kubectl
alias da='docker run --rm -it -v "${PWD}:/playbook" -v "${HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/dynapro-ansible-exec'
alias deb10="ssh -x cmccarth@ah-cmccarth-l.dhcp.mathworks.com"
alias ytd='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/youtube-dl'

export PYENV_ROOT=$HOME/.pyenv

if [[ -d $PYENV_ROOT ]]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    root_indicator
    context
    dir
    vcs
    virtualenv
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    background_jobs
    vi_mode
    pyenv
)

POWERLEVEL9K_VI_INSERT_MODE_STRING=''
POWERLEVEL9K_VI_COMMAND_MODE_STRING="VI"

