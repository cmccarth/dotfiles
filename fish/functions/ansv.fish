function ansv --description "Run ansible-vault installed in venv"
    $HOME/.venv/ansible/bin/ansible-vault $argv --vault-password-file (__find_vault_password_up);
end
