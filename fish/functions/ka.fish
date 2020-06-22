function ka --description "Run kolla-ansible in Docker container"
	docker run --rm -it -v "$LOCALDIR/cmccarth/kolla-ansible:/kolla-ansible" -v "$LOCALDIR/cmccarth/kolla-config:/etc/kolla" -v "$LOCALDIR/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cloud/openstack/kolla-ansible-exec:20200622 $argv;
end
