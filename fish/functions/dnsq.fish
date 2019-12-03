function dnsq --description "Search mathworks.com DNS records"
	host -t axfr mathworks.com | grep -i $argv;
end
