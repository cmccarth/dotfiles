set PATH {$HOME}/.poetry/bin {$HOME}/bin /Applications/Visual\ Studio Code.app/Contents/Resources/app/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/gnu-getopt/bin {$HOME}/go/bin $PATH

if uname | grep Darwin > /dev/null 2>&1
    set -x LOCALDIR $HOME/local
    set -x FLAGS_GETOPT_CMD /usr/local/opt/gnu-getopt/bin/getopt
else
    set -x LOCALDIR /local
end

if hostname | grep alderaan > /dev/null 2>&1
    if ssh-add -l | grep "The agent has no identities" > /dev/null 2>&1
        ssh-add --apple-load-keychain
        #ssh-add --apple-load-keychain /Users/chris/.ssh/github_rsa
    end
end

set PYENV_ROOT $HOME/.pyenv

if test -d $PYENV_ROOT
    set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
    pyenv rehash
end

# if status is-interactive
#     fish_vi_key_bindings
# end

if hostname | grep alderaan > /dev/null 2>&1
    set -Ux EDITOR "code -w"
else if which vim > /dev/null 2>&1
    set -Ux EDITOR "vim"
else
    set -Ux EDITOR "vi"
end

# Disable virtualenv in prompt when using bobthefish
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# https://brettterpstra.com/2019/11/11/fish-further-exploration/
abbr -a -U -- - prevd
abbr -a -U -- = nextd

if hostname | egrep -qs '(coruscant|korriban|alderaan|ah-cmccarth)'
    if cd $HOME/git/dotfiles && git remote update > /dev/null 2>&1 && git status -uno | grep -q '^Your branch is behind'
        echo "Local dotfiles repo is behind and should be pulled"
    end; cd $HOME
end

set -g theme_color_scheme light

if which kubectl > /dev/null 2>&1
    kubectl completion fish | source
end
