if [[ -z "$SSH_CLIENT" ]] || [[ -z "$SSH_TTY" ]]; then
    MYEDITOR="atom -w"
elif which vim > /dev/null 2>&1; then
    MYEDITOR="vim"
else
    MYEDITOR="vim"
fi

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

stty sane

eval "$(pyenv init -)"
