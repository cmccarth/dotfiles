function os3 --description "Run openstack command in openstack-clients container"
    docker run \
        --rm \
        --volume=/private/etc/openstack/clouds.yaml:/clouds.yaml \
        --dns=172.30.237.8 \
        --dns=172.30.237.9 \
        --dns-search=mathworks.com \
        --dns-search=dhcp.mathworks.com \
        docker.bserepo.mathworks.com/cloud/openstack/openstack-clients \
        $argv[1] \
        openstack \
        $argv[2..-1]
end
