function tf --description "Run terraform in container"
	docker run -p 9000:9000 --rm -it --env-file $HOME/osy-lsbat.env docker.bserepo.mathworks.com/bse/cloud/openstack/openstack-resource-manager:branch-main
end
