set PATH {$HOME}/bin $PATH

set PYENV_ROOT $HOME/.pyenv

if test -d $PYENV_ROOT
    set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
    pyenv rehash
end

if status is-interactive
    fish_vi_key_bindings
end

# Disable virtualenv in prompt when using bobthefish
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# https://brettterpstra.com/2019/11/11/fish-further-exploration/
abbr -a -U -- - prevd
abbr -a -U -- = nextd
