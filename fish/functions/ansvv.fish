function ansvv --description "Run ansible-vault installed in venv with poetry"
    $HOME/.venv/poetry-bse-ansible/bin/ansible-vault $argv
end
