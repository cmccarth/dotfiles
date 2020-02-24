function ansv --description "Run ansible-vault in Docker container"
    docker run --rm -it -v "$PWD:/playbook" -v "$LOCALDIR/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/ansible-base ansible-vault $argv;
end
