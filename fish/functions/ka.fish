function ka --description "Run kolla-ansible installed in venv"
    source $HOME/.venv/kolla-ansible/bin/activate.fish
	kolla-ansible --inventory $HOME/git/kolla-config/inventory --configdir $HOME/git/kolla-config --passwords $HOME/git/kolla-config/passwords.yml $argv
    deactivate
end
