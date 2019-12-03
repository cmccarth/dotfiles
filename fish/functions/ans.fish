function ans --description "Run ansible in Docker container"
    docker run --rm -it -v "$PWD:/playbook" -v "$HOME/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/ansible-base ansible $argv;
end
