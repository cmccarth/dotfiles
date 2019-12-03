function os --description 'alias os=docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cloud/openstack-client --os-cloud'
	docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cloud/openstack-client --os-cloud $argv;
end
