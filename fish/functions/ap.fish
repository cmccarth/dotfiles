function ap --description "alias -s ap='docker run --rm -it -v "{$PWD}:/playbook" -v "{$HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/ansible-base ansible-playbook'"
    docker run --rm -it -v "{$PWD}:/playbook" -v "{$HOME}/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/ansible-base ansible-playbook $argv;
end
