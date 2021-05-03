function ansv --description "Run ansible-vault installed in venv with poetry"
    $HOME/.venv/poetry-bse-ansible/bin/ansible-vault $argv --vault-password-file (__find_vault_password_up);
end
