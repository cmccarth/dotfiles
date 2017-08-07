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

[[ -f $HOME/.iterm2_shell_integration.bash ]] && source $HOME/.iterm2_shell_integration.bash

eval "$(thefuck --alias)"
