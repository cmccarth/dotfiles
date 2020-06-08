function ap --description "Run ansible-playbook in Docker container"
    docker run --rm -it -v (pwd -P):/playbook -v "$LOCALDIR/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/ansible-base:20200608 ansible-playbook $argv;
end
