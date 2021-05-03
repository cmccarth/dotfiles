function ans --description "Run ansible installed in venv with poetry"
    $HOME/.venv/poetry-bse-ansible/bin/ansible $argv;
end
