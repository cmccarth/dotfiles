function ka --description "Run kolla-ansible in Docker container"
	docker run --rm -it -v "$LOCALDIR/cmccarth/kolla-ansible:/kolla-ansible" -v "$LOCALDIR/cmccarth/kolla-config:/etc/kolla" -v "$LOCALDIR/.ssh:/root/.ssh" docker.bserepo.mathworks.com/cmccarth/kolla-ansible-exec $argv;
end
