function cat --description "Show contents of file with bat if available, with cat if not"
    if test (which bat)
        if test (uname) = "Linux"
            bat --style plain --theme ansi-light $argv
        else
            bat --style plain --theme ansi $argv
        end
    else
        /bin/cat $argv
    end
end
