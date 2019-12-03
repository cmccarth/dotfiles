function os --description "Run openstack command in Docker container"
	docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cloud/openstack-client --os-cloud $argv;
end
