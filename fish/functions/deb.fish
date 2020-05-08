function deb --description "Connect to Debian machine"
    echo -ne "\033]0;deb\007"
    ssh cmccarth@ah-cmccarth2-l.mathworks.com $argv;
end
