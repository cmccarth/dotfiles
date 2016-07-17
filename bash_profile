if [[ -z "$SSH_CLIENT" ]] || [[ -z "$SSH_TTY" ]]; then
    MYEDITOR="atom -w"
elif which vim > /dev/null 2>&1; then
    MYEDITOR="vim"
else
    MYEDITOR="vi"
fi

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

stty sane

eval "$(pyenv init -)"

if git -C ~/dotfiles status -uno | grep --silent "^Your branch is up-to-date with 'origin/master'.$"; then
    :
else
    echo "dotfiles are out of date"
fi
