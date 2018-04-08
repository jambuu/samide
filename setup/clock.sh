trap ctrl_c INT

function ctrl_c() {
    # when the program is killed, reenable cursor
    setterm -cursor on
    exit; 
}

# Before running our clock, disable the cursor
setterm -cursor off

# We only track hours and minutes since seconds would be
# too distracting
minutes=0
while true; do
    printf "\033c";
    ./clock_maker.sh;
    sleep 60;
    let "minutes++"

done;

