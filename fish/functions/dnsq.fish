function dnsq --description 'alias dnsq=host -t axfr mathworks.com | grep -i'
	host -t axfr mathworks.com | grep -i $argv;
end
