function cat --description "Show contents of file with bat if available, with cat if not"
    if test (which bat)
        set -x BAT_COMMAND bat
    else if test (which batcat)
        set -x BAT_COMMAND batcat
    end
    if test -n $BAT_COMMAND
        $BAT_COMMAND --style plain --theme "Solarized (light)" $argv
    else
        /bin/cat $argv
    end
end
