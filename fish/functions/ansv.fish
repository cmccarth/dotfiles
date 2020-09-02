function ansv --description "Run ansible-vault in Docker container"
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
        docker.bserepo.mathworks.com/cloud/ansible-base:20200608 \
        ansible-vault $argv;
end
