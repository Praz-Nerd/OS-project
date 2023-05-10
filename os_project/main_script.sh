#!/bin/bash
clear
touch ./logfile.txt #logul nostru (work in progress, poate vrea clim nume personalizat pt fisier)
printf "\nThe project\nChoose one of these options:\n1) do one\n2) do two\n3) do three\n4) do four\n5) exit and save with log\n6) exit and don't save\n"
read -p "Your option: " sel
while ((sel != 5)) && ((sel != 6)); #leading file algorithm (kill me)
do
    clear
    if ((sel > 0)) && ((sel < 5));
    then
        printf "\nYour choice is %d \n" $sel
        
        case $sel in #gen switch din C dar mai retardat, apelam scripturile secundare pt fiecare (modularity FTW)
            1)       #de tip REGEX_PATTERN) (mai bun decat switchul din C (poate nu chiar asa retardat))
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
    printf "\nChoose one of these options:\n1) do one\n2) do two\n3) do three\n4) do four\n5) exit and save with log\n6) exit and don't save\n"
    read -p "Your option: " sel

done

if ((sel == 6));
then
    rm ./logfile.txt #stergem logul, dupa caz
elif((sel == 5));
then
    echo "Log file saved"
fi
