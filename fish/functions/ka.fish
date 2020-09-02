function ka --description "Run kolla-ansible in Docker container"
	docker run \
		--rm \
        --interactive \
        --tty \
        --volume="$LOCALDIR/cmccarth/kolla-ansible:/kolla-ansible" \
		--volume="$LOCALDIR/cmccarth/kolla-config:/etc/kolla" \
        --volume="$LOCALDIR/.ssh:/root/.ssh" \
        --dns=172.30.237.8 \
        --dns=172.30.237.9 \
        --dns-search=mathworks.com \
        --dns-search=dhcp.mathworks.com \
		docker.bserepo.mathworks.com/cloud/openstack/kolla-ansible-exec:20200624 \
		$argv;
end
