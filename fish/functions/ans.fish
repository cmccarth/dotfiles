function ans --description "Run ansible in Docker container"
    docker run --rm -it -v (pwd -P)/playbook -v "$LOCALDIR/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/ansible-base ansible $argv;
end
