#!/bin/bash
optime=$(date +%c) #timpul de afisat in logfile

echo  "$optime first script, yay" | tee -a logfile.txt
