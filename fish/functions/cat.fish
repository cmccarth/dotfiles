function cat --description "Show contents of file with bat if available, with cat if not"
    if test (which bat)
        bat --style plain --theme ansi $argv
    else
        /bin/cat $argv
    end
end
