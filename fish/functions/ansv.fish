function ansv--description "alias -s ansv='docker run --rm -it -v "{$PWD}:/playbook" -v "{$HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/ansible-base ansible-vault'"
    docker run --rm -it -v "{$PWD}:/playbook" -v "{$HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/ansible-base ansible-vault $argv;
end
