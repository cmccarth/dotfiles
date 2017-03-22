if [[ -z "$SSH_CLIENT" ]] || [[ -z "$SSH_TTY" ]]; then
    MYEDITOR="code -w"
elif which vim > /dev/null 2>&1; then
    MYEDITOR="vim"
else
    MYEDITOR="vi"
fi

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

stty sane

if [[ $(hostname) == "cmccarth-deb8-64" ]]; then
    export PYENV_ROOT=$HOME/.pyenv
else
    export PYENV_ROOT=/usr/local/var/pyenv
fi

if which pyenv 2> /dev/null > /dev/null; then eval "$(pyenv init -)"; fi

[[ -f $HOME/.iterm2_shell_integration.bash ]] && source $HOME/.iterm2_shell_integration.bash
