set PYENV_ROOT $HOME/.pyenv

if test -d $PYENV_ROOT
    set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
    pyenv rehash
end
