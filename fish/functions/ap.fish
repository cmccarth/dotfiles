function ans --description "Run ansible-playbook installed in pyenv"
    $HOME/.pyenv/shims/ansible-playbook $argv;
end
