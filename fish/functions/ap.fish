function ap --description "Run ansible-playbook installed in venv"
    $HOME/.venv/ansible/bin/ansible-playbook $argv;
end
