function ansv --description "Run ansible-vault installed in pyenv"
    $HOME/.pyenv/shims/ansible-vault $argv --vault-password-file (__find_vault_password_up);
end
