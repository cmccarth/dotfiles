function __find_vault_password_up -d 'Helper to walk up the directory structure to find a .vault_password file'
    set -l old_pwd (pwd)
    while test (pwd) != /
        if test -f .vault_password
            echo (pwd)/.vault_password
            break
        else
            cd ..
        end
    end
    cd $old_pwd
end
