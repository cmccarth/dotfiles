function ans --description "alias -s ans='docker run --rm -it -v "{$PWD}:/playbook" -v "{$HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/ansible-base ansible'"
    docker run --rm -it -v "{$PWD}:/playbook" -v "{$HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/ansible-base ansible $argv;
end
