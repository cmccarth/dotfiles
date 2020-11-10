function ansv2 --description "Run ansible-vault in virtualenv"
    source ~/.venv/ansible/bin/activate.fish
    ansible-vault $argv
    deactivate
end
