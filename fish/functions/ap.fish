function ap --description "Run ansible-playbook in Docker container"
    docker run --rm -it -v "$PWD:/playbook" -v "$HOME/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/ansible-base ansible-playbook $argv;
end
