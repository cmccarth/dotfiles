set PATH {$HOME}/bin /Applications/Visual\ Studio Code.app/Contents/Resources/app/bin $PATH

if uname | grep Darwin > /dev/null 2>&1
    set -x LOCALDIR $HOME/local
else
    set -x LOCALDIR /local
end

set PYENV_ROOT $HOME/.pyenv

if test -d $PYENV_ROOT
    set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
    pyenv rehash
end

#if status is-interactive
    #fish_vi_key_bindings
#end

if which vim > /dev/null 2>&1
    set -Ux EDITOR "vim"
else
    set -Ux EDITOR "vi"
end

# Disable virtualenv in prompt when using bobthefish
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# https://brettterpstra.com/2019/11/11/fish-further-exploration/
abbr -a -U -- - prevd
abbr -a -U -- = nextd

if hostname | egrep -qs '(coruscant|korriban|corellia|ah-cmccarth)'
    if cd $HOME/git/dotfiles && git remote update > /dev/null 2>&1 && git status -uno | grep -q '^Your branch is behind'
        echo "Local dotfiles repo is behind and should be pulled"
    end; cd $HOME
end

#set -g theme_color_scheme light
