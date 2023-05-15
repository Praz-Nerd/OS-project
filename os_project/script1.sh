#!/bin/bash
#a=97
echo "The BASH Caesar Cipher!"
while true;
do
    read -p  "Enter a string to be encrypted: " input
    if [[ "$input" =~ ^[a-z]+$ ]]; then
        break
    else
        echo "Invalid input. Please enter a string of lower case letters..."
    fi
done

while true;
do
    read -p  "Enter an offset: " offset
    if [[ "$offset" =~ ^[0-9]+$ ]]; 
    then
        if((offset < 26)) && ((offset > 0)); 
        then
        break
        else
            echo "Invalid input. Please enter a number smaller than 26..."
        fi
    else
        echo "Invalid input. Please enter a number..."
    fi
done

touch temp_caesar.txt
echo -n "Your encrypted message is: "
for ((i=0; i<${#input}; i++));
do
    char=$(printf "%d" "'${input:$i:1}'")
    char=$((char-97+offset))
    char=$((char%26))
    char=$((char+97))
    chared=$(printf \\$(printf "%o" "$char"))
    echo -n "$chared" | tee -a temp_caesar.txt
done
output=$(cat temp_caesar.txt)
rm temp_caesar.txt
echo "$(date +%c) script1: input = $input; offset = $offset; output = $output" >> logfile.txt
