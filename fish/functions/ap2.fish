function ap2 --description "Run ansible-playbook in virtualenv"
    source ~/.venv/ansible/bin/activate.fish
    ansible-playbook $argv
    deactivate
end
