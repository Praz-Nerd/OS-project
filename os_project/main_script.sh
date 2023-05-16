#!/bin/bash
clear
touch ./logfile.txt 
printf "\nThe project\nChoose one of these options:\n1) Caesar Cipher\n2) Process Checker\n3) Password Generator\n4) Memory Usage Analyzer\n5) exit and save with log\n6) exit and don't save\n"
read -p "Your option: " sel
while ((sel != 5)) && ((sel != 6)); 
do
    clear
    if ((sel > 0)) && ((sel < 5));
    then
        printf "\nYour choice is %d \n" $sel
        
        case $sel in 
            1)       
                ./script1.sh
            ;;
            2)
                ./script2.sh
            ;;
            3)
                ./script3.sh
            ;;
            4)
                ./script4.sh
            ;;
            *)
                echo "something else, i dunno"
            ;;
        esac

    else
        printf "\nInvalid selection..."
    fi
    printf "\nThe project\nChoose one of these options:\n1) Caesar Cipher\n2) Process Checker\n3) Password Generator\n4) Memory Usage Analyzer\n5) exit and save with log\n6) exit and don't save\n"
    read -p "Your option: " sel

done

if ((sel == 6));
then
    rm ./logfile.txt 
elif((sel == 5));
then
    echo "Log file saved"
fi
