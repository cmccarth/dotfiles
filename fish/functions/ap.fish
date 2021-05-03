function ap --description "Run ansible-playbook installed in venv with poetry"
    $HOME/.venv/poetry-bse-ansible/bin/ansible-playbook $argv;
end
