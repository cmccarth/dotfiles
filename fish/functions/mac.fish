function maci --description "Connect to cmccarth-maci"
    echo -ne "\033]0;mac\007"
	ssh chris@ah-cmccarth-mac.dhcp.mathworks.com $argv;
end
