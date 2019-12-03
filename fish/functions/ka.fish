function ka --description "Run kolla-ansible in Docker container"
	docker run --rm -it -v ~/git/kolla-ansible:/kolla-ansible -v ~/git/kolla-config:/etc/kolla -v ~/.ssh/ka:/root/.ssh docker.bserepo.mathworks.com/cmccarth/kolla-ansible-exec $argv;
end
