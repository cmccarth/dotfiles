function da --description "Run ansible-playbook for dynapro-ansible installed in venv with poetry"
    $HOME/.venv/poetry-dynapro-ansible/bin/ansible-playbook $argv;
    if not echo $argv[-1] | grep '\.yml$' > /dev/null 2>&1
        set -a argv operate-dynapro.yml
    end
    if not contains -- --key-file $argv
        and not contains -- --private-key $argv
        set -p argv --private-key ~/.ssh/bsepooling-00
    end
    if not contains -- -i $argv
        and not contains -- --inventory $argv
        set -p argv --inventory inventory
    end
    $HOME/.venv/poetry-dynapro-ansible/bin/ansible-playbook $argv
end
