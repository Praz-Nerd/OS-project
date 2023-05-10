#!/bin/bash
optime=$(date +%c) #timpul de afisat in logfile

echo 'See memory usage:    (Press q to exit) '
input='a'
max=0;

while true; do
	read -t 1.5 input ;
	if [[ $input = "q" ]]
		then break
	else
		mem=$(inxi -c | grep -o "Mem.*")
		max=$mem | grep -o '(.....)'
		time=$(date | grep -o '..:..:..')
		echo "$mem $time $max"
	fi
done
