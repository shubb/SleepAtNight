#!/bin/bash

. /etc/SleepAtNight.config

echo "Starting SleepAtNight. This workstation will sleep between ${START} and ${END}"

while :
do
    CURRENT_DATE_TIME=$(date "+%Y-%m-%d %H:%M")
    CURRENT_DATE_TIME="2019-10-14 23:10"

    # If START is in the morning then it occurs tomorrow
    if  [[ "$START" < "12:00" ]] &&
        [[ "$CURRENT_DATE_TIME" > "12:00" ]]; then
        DATE_TIME_START=$(date -d "tomorrow" "+%Y-%m-%d ${START}");
    else
        DATE_TIME_START=$(date "+%Y-%m-%d ${START}");
    fi

    # If END is in the morning then it occurs tomorrow
    if  [[ "$END" < "12:00" ]] &&
        [[ "$CURRENT_DATE_TIME" > "12:00" ]]; then
        DATE_TIME_END=$(date -d "tomorrow" "+%Y-%m-%d ${END}");
    else
        DATE_TIME_END=$(date "+%Y-%m-%d ${END}");
    fi

    # If current time is within the sleep zone
    if  [[ "${CURRENT_DATE_TIME}" > "${DATE_TIME_START}" ]] &&
        [[ "${CURRENT_DATE_TIME}" < "${DATE_TIME_END}" ]]; then
    
        systemctl suspend;
    
    fi

    sleep 30;
done