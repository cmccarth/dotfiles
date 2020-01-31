function deb10 --description "Connect to Debian 10 machine"
    echo -ne "\033]0;deb10\007"
	ssh cmccarth@ah-cmccarth-l.dhcp.mathworks.com $argv;
end
