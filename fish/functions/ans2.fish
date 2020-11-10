function ans2 --description "Run ansible in virtualenv"
    source ~/.venv/ansible/bin/activate.fish
    ansible $argv
    deactivate
end
