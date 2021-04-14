function ka --description "Run kolla-ansible installed in venv"
	$HOME/.venv/kolla-ansible/bin/kolla-ansible --inventory $HOME/git/kolla-config/inventory --configdir $HOME/git/kolla-config --passwords $HOME/git/kolla/config/passwords.yml $argv;
end
