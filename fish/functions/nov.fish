function nov --description "Run nova command in Docker container"
    docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cmccarth/nova-client $argv;
end
