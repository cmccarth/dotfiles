function deb --description "Connect to Debian machine"
    if ! pgrep -q openconnect
        vpn
    end
    mosh cmccarth@ah-cmccarth3-l.mathworks.com $argv;
end
