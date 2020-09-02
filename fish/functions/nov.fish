function nov --description "Run nova command in Docker container"
    docker run \
        --rm \
        --volume=/private/etc/openstack/clouds.yaml:/clouds.yaml \
        --dns=172.30.237.8 \
        --dns=172.30.237.9 \
        --dns-search=mathworks.com \
        --dns-search=dhcp.mathworks.com \
        docker.bserepo.mathworks.com/cmccarth/nova-client \
        $argv;
end
