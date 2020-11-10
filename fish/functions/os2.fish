function os2 --description "Run openstack command in virtualenv"
    source ~/.venv/openstack-client/bin/activate.fish
    openstack --os-cloud $argv
    deactivate
end
