#!/bin/bash
#optime=$(date +%c) #timpul de afisat in logfile

echo 'See memory usage:    (Press q to exit) '
input='a'
max=0;
last_max=0;
while true; do
	read -t 1.5 input ;
	if [[ $input = "q" ]]
		then break
	else
		mem=$(inxi -c | grep -o "Mem.*")
		max=$(echo $mem | grep -o "....%") 
	      	if (( ${max%???} > $last_max )); then
			last_max=${max%???};	
		fi
			
		time=$(date | grep -o '..:..:..')
		echo "$mem $time $max" | tee -a logfile.txt
	fi
done
echo "Most RAM used: $last_max %"
echo "$(date +%c) Most RAM used: $last_max %" >> logfile.txt
