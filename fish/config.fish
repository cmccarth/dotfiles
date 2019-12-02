set PYENV_ROOT $HOME/.pyenv

if test -d $PYENV_ROOT
    set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
    pyenv rehash
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish ; or true

