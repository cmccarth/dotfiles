function vpn --description "Start (or end) VPN session and initialize SSO"
    if test (count $argv) -eq 0
        if /opt/cisco/anyconnect/bin/vpn status | grep 'state: Disconnected' > /dev/null 2>&1
            printf '1\ncmccarth\n'(security find-generic-password -a cmccarth -s AD.MATHWORKS.COM -w) | /opt/cisco/anyconnect/bin/vpn -s connect "United States Natick 2" && sleep 2 && kinit --keychain cmccarth@AD.MATHWORKS.COM 
        else
            /opt/cisco/anyconnect/bin/vpn disconnect
        end
    else if test $argv[1] = 'status'
        /opt/cisco/anyconnect/bin/vpn status
    else
        echo "Unsupported use of vpn"
    end
end
