if [[ $TMUX ]]; then
    exec fish
fi

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

if hostname | egrep -qs '(coruscant|korriban|corellia|ah-cmccarth)'; then
    if cd $HOME/git/dotfiles && git remote update > /dev/null 2>&1 && git status -uno | grep -q '^Your branch is behind'; then
        echo "Local dotfiles repo is behind and should be pulled"
    fi; cd $HOME
fi
