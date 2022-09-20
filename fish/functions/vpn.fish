function vpn --description "Start (or end) VPN session and initialize SSO"
    if pgrep -q openconnect
        read --local --prompt-str "VPN is connected; disconnect now? [y/N] " disconnect
        switch $disconnect
            case Y y
                sudo pkill openconnect
        end
    else
        read --local --prompt-str "VPN is not connected; connect now? [y/N] " connect
        switch $connect
            case Y y
                security find-generic-password -a cmccarth -s AD.MATHWORKS.COM -w | \
                sudo openconnect zakim.mathworks.com --authgroup=MFA --user=cmccarth --passwd-on-stdin --background --quiet > /dev/null 2>&1 && \
                sleep 2 && kinit --keychain cmccarth@AD.MATHWORKS.COM
        end
    end
end
