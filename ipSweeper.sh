#!/bin/bash #it is bassically a comment where we are telling the computer that, it is a bash script.
for ip in `seq 1 254`; do 
#This is a for loop where we want to execute the command for every ip in the network range.
#Thus we write a for loop and execute it in a range for 1-254 that is the number of ip addresses 
#in the particualar network.
ping -c 1 $1.$ip | grep "64 bytes" | cut -d ""  
#Ping to ping the ip address. -c 1: for ping one ip at a time. $1.$ip: $1 will be the user input.
#We will input the first three ranges of the IP and the last range will be taken from the for loop.
#Example: If user input was 192.69.1.1 then in the first run of for loop $ip will be 1.
#Thus $1.$ip will result in 192.69.1.1 and it will ping this IP.

# grep "64 Bytes": Try running a ping command to an ip. If the ip responds, the result will be "64 bytes from (given_ip)"
#Thus if the ip is active, it will responed and response will be contain the term "64 bytes". Thus, grep "64bytes" will simply filter out the ip's that responded from a
# a total 254 ip addresses. 
-f 4 | tr -d ":" &
done
#This command is basically does the same thing. It cuts the whole response with the delimiter (-d) 
#white space ("") and picks the 4the  term(-f4) from it, that will be the ip.

#tr-d ":" Here we pass colon (:) as a delimiter and tr command deletes it.

# & basically allows the thread to work simultaneously.
#The cut command will basically produce output like 192.69.1.1

#This script will execute and return the IP addresses in the specified domain range that had responded to the ping.