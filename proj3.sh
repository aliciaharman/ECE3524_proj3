#!/bin/bash

line="---------------------------------------------------------"
press_enter="Press [Enter] key to continue..."

main_menu () {
	date=$(date)
	echo "$date"
	echo "------------------------------"
	echo " Main Menu"
	echo "------------------------------"
	echo "1. Operating system info"
	echo "2. Hostname and DNS info"
	echo "3. Network info"
	echo "4. Who is online"
	echo "5. Last logged in users"
	echo "6. My IP address"
	echo "7. My disk usage"
	echo "8. My home file-tree"
	echo "9. Process operations"
	echo "10. Exit"
	read -p "Enter your choice [ 1 - 10 ] " choice
}

operating_system_info () {
	echo $line
	echo " System information"
	echo $line
	os=$(uname -s)
	echo "Operating system : $os"
	info=$(/usr/bin/lsb_release -a)
	echo "$info"
	read -p "$press_enter" enter
}

hostname_dns_info () {
	echo $line
	echo " Hostname and DNS information"
	echo $line
	hostname=$(hostname)
	echo "Hostname : $hostname"
	dnsdomain=$(dnsdomainname)
	echo "DNS domain : $dnsdomain"
	fqdn=$(hostname --fqdn)
	echo "Fully qualified domain name : $fqdn"
        ip_addr=$(hostname -I)
	echo "Network address (IP) : $ip_addr"
	dns_server=$(cat /etc/resolv.conf | grep nameserver)
	echo "DNS name servers (DNS IP) : $dns_server"
	read -p "$press_enter" enter
}

network_info () {
	echo $line
	echo " Network information"
	echo $line
	count=$(ls -A /sys/class/net | wc -l)
	echo "Total network interfaces found : $count"
	echo "*** IP Addresses Information ***"
	addr=$(ip addr show)
	echo "$addr"
	echo "***********************"
	echo "*** Network routing ***"
	echo "***********************"
	route=$(netstat -nr)
	echo "$route"
	echo "*************************************"
	echo "*** Interface traffic information ***"
	echo "*************************************"
	interface=$(netstat -i)
	echo "$interface"
	read -p "$press_enter" enter
}

who_is_online () {
	echo $line
	echo " Who is online"
	echo $line
	online=$(who -H)
	echo "$online"
	read -p "$press_enter" enter
}

last_logged_in () {
	echo $line
	echo " List of last logged in users"
	echo $line
	last=$(last)
	echo "$last"
	read -p "$press_enter" enter
}

ip_addr () {
	echo $line
	echo " Public IP information"
	echo $line
	ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
	echo "$ip"
	read -p "$press_enter" enter
}

disk_usage () {
	echo $line
	echo " Disk Usage Info"
	echo $line
	usage=$(df --output=pcent,target | sed 1d)
	echo "$usage"
	read -p "$press_enter" enter
}

home_tree () {
	./proj1.sh ~ filetree.html
}

process_operations () {
	./proc.sh
}

while :
do
	main_menu
	if [ $choice -eq 10 ] 
	then
		break
	
	elif [ $choice -eq 1 ] 
	then
		operating_system_info
	
	elif [ $choice -eq 2 ]
	then
		hostname_dns_info
	
	elif [ $choice -eq 3 ] 
	then
		network_info

	elif [ $choice -eq 4 ]
	then
		who_is_online
	
	elif [ $choice -eq 5 ]
	then
		last_logged_in

	elif [ $choice -eq 6 ]
	then
		ip_addr
	
	elif [ $choice -eq 7 ]
	then
		disk_usage
	
	elif [ $choice -eq 8 ] 
	then
		home_tree

	elif [ $choice -eq 9 ] 
	then
		process_operations

	else
		echo "error: enter number 1 - 10"
	fi
done
