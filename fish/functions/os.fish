function os --description "Run openstack command installed in venv"
    $HOME/.venv/openstack-client/bin/openstack --os-cloud $argv
end
