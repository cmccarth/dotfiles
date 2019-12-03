function gla --description "Run glance command in Docker container"
	docker run --rm -v /private/etc/openstack/clouds.yaml:/clouds.yaml docker.bserepo.mathworks.com/cmccarth/glance-client $argv;
end
