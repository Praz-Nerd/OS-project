#!/bin/bash

echo "Strong Password Generator"
read -p "Enter password length: " len
while true;
do
    if ((len < 8));
    then
        echo "Your password length is too short..."
        read -p "Enter password length: " len
        else
        break
    fi
done
passwd=$(tr -dc 'a-zA-Z0-9!@#$%&*' < /dev/urandom | fold -w "$len" | head -n 1)
echo "Generated password: $passwd"
echo "Do not share it with anyone"
echo "$(date +%c) PasswordGenerator: length = $len; output = $passwd" >> logfile.txt