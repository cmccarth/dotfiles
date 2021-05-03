function os --description "Run openstack command installed in venv with poetry"
    $HOME/.venv/poetry-openstack-clients/bin/openstack --os-cloud $argv
end
