#!/bin/bash
#optime=$(date +%c) #timpul de afisat in logfile
clear
read -p "Your service: " service

if ps ax | grep -v grep | grep $service > /dev/null
then
    read -p "$service is running. Do you want to kill it?(1 for yes/0 for no)          Answer:" selection1
    if (( $selection1!=0 )) && (( $selection1==1 ));
       then
        pid=$(ps -C $service -o pid=)
        kill $pid
        echo "$service has been terminated. Done."
        echo "$(date +%c) ProcessChecker: input = $service; $service haas been terminated " >> logfile.txt
       else
        echo "The process $service was not terminated. Stopping here..."
        echo "$(date +%c) ProcessChecker: input = $service; $service was not terminated" >> logfile.txt
    fi
else
    read -p "$service is not running. Do you want to restart it?(1 for yes/0 for no)          Answer:" selection2
    if (( $selection2!=0 )) && (( $selection2==1 ));
       then
         echo "Restarting process $service ..."
         systemctl start $service
         echo "$(date +%c) ProcessChecker: input = $service; $service was restarted" >> logfile.txt
       else
         echo "The process $service was not restarted. Stopping here..."
         echo "$(date +%c) ProcessChecker: input = $service; $service is not running" >> logfile.txt
    fi

fi
