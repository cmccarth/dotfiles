function ap --description "Run ansible-playbook in Docker container"
    docker run \
        --rm \
        --interactive \
        --tty \
        --volume=(pwd -P):/playbook \
        --volume="$LOCALDIR/.ssh:/root/.ssh" \
        --dns=172.30.237.8 \
        --dns=172.30.237.9 \
        --dns-search=mathworks.com \
        --dns-search=dhcp.mathworks.com \
        --env HOST_UID=(id -u) \
        --env HOST_GID=(id -g) \
        docker.bserepo.mathworks.com/cloud/ansible-base:20201116 \
        ansible-playbook $argv;
end
