#!/bin/bash

logFile=job_results.log

# This is to simply run using the "at" command
# If "at" is not installed run "sudo apt install at"
# Then run the command "at 15:00 -f ./script.sh"

echo "The script ran at the following time: $(date)" >> $logFile
