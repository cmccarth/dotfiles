function cat --description "Show contents of file with bat if available, cat if not"
    if test (which bat)
        bat --style plain $argv
    else
        cat $argv
    end
end
