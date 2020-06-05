function ansv --description "Run ansible-vault in Docker container"
    docker run --rm -it -v (pwd -P):/playbook -v "$LOCALDIR/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/ansible-base:20200521 ansible-vault $argv;
end
