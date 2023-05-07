#!/bin/bash
printf "\nThe project
Choose one of these options:
    1) do one
    2) do two
    3) do three
    4) do four
    5) exit and save with log
    6) exit and don't save\n"
read -p "Your option: " sel

while ((sel != 5)) && ((sel != 6));
do
    clear
    if ((sel > 0)) && ((sel < 5));
    then
        printf "\nYour choice is %d" $sel
    else
        printf "\nInvalid selection..."
    fi
    printf "\nChoose one of these options:
    1) do one
    2) do two
    3) do three
    4) do four
    5) exit and save with log
    6) exit and don't save\n"
    read -p "Your option: " sel
done
echo "bye bitch"

