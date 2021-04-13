function ka --description "Run kolla-ansible installed in pyenv"
	$HOME/git/kolla-ansible/tools/kolla-ansible --inventory $HOME/git/kolla-config/inventory --configdir $HOME/git/kolla-config --passwords $HOME/git/kolla/config/passwords.yml $argv;
end
