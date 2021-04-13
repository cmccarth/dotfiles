function os --description "Run openstack command installed in pyenv"
    $HOME/.pyenv/shims/openstack --os-cloud $argv
end
