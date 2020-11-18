function nov --description "Run nova command in openstack-clients container"
    docker run \
        --rm \
        --volume=/private/etc/openstack/clouds.yaml:/clouds.yaml \
        --dns=172.30.237.8 \
        --dns=172.30.237.9 \
        --dns-search=mathworks.com \
        --dns-search=dhcp.mathworks.com \
        --env HOST_UID=(id -u) \
        --env HOST_GID=(id -g) \
        docker.bserepo.mathworks.com/cloud/openstack/openstack-clients:20201116 \
        $argv[1] \
        nova \
        $argv[2..-1]
end
