#!/bin/bash

logFile=/home/sysadmin/bash-scripts/useful/job_results.log

# This is to be ran as a cron job
# Open the cron schedule by running "crontab -e"
# Then add syntax "30 1 * * 5 /usr/local/bin/schedulingCronJobs"
# This schedules the job to be run every Friday at 1:30 AM

/usr/bin/echo "The script ran at the following time: $(/usr/bin/date)" >> $logFile
