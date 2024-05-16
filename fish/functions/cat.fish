function cat --description "Show contents of file with bat if available, with cat if not"
    if test (which bat)
        set -x BAT_COMMAND bat
    else if test (which batcat)
        set -x BAT_COMMAND batcat
    end
    if test -n $BAT_COMMAND
        if test $BAT_COMMAND = bat
            $BAT_COMMAND --style plain --theme "ansi" $argv
        else
            $BAT_COMMAND --style plain --theme "ansi-light" $argv
        end
    else
        /bin/cat $argv
    end
end
