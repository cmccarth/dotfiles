function deb9 --description "Connect to Debian 9 machine"
    echo -ne "\033]0;deb9\007"
	ssh cmccarth@cmccarth-deb9-64.mathworks.com $argv;
end
