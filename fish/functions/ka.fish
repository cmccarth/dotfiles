function ka --description 'alias ka=docker run --rm -it -v ~/git/kolla-ansible:/kolla-ansible -v ~/git/kolla-config:/etc/kolla -v ~/.ssh/ka:/root/.ssh docker.bserepo.mathworks.com/cmccarth/kolla-ansible-exec'
	docker run --rm -it -v ~/git/kolla-ansible:/kolla-ansible -v ~/git/kolla-config:/etc/kolla -v ~/.ssh/ka:/root/.ssh docker.bserepo.mathworks.com/cmccarth/kolla-ansible-exec $argv;
end
