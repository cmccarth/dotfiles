function ka --description "Run kolla-ansible in Docker container"
	docker run --rm -it -v /local/cmccarth/kolla-ansible:/kolla-ansible -v /local/cmccarth/kolla-config:/etc/kolla -v /local/.ssh:/root/.ssh docker.bserepo.mathworks.com/cmccarth/kolla-ansible-exec $argv;
end
