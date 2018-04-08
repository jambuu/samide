#!/bin/bash

# Do we have the toilet package?
if hash toilet 2>/dev/null; then
    echo " "$(date +"%I:%M")" " | \
        toilet -f future --filter border > /tmp/terminal
# else use standard font
else
    echo $(date +"%I:%M:%S %P") > /tmp/terminal
fi

while IFS= read -r Time; do
    printf "\033[01;32m" # color green
    printf "$Time"
    tput cud1           # Up one line
done < /tmp/terminal

exit 0
