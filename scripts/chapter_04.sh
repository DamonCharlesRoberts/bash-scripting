#!/opt/homebrew/bin/bash

# Functions
#   * Create one to convert from Fahrenheit to Celsius.
#       ** Define a variable.
temP_f=30
#       ** Define the function that takes the value.
#       ** Does the conversion.
#       ** And then returns the result.
function convert_temp {
    temp_c=$(echo "scale=2; ($temp_f - 32) * 5 / 9" | bc)
    echo $temp_c
}
#   * Call the function
convert_temp
#   * Arguments, return values and scope
#       ** Pass arguments the same way as args.
#           *** $n for specific args
#           *** $@ and $* for all arguents
#           *** $# for length of args
#       ** Define a function
#           *** takes file names
#           *** loop them
#           *** print.
function print_filename {
    echo "The first file was $1"
    for file in $@
    do
        echo "This file has name $file"
    done
}
        #** Call the function.
print_filename "LOTR.txt" "mod.txt" "A.py"
#   * All variables in Bash are global by default. Even in a function.
#       # ** Which departs from python.
#       # ** Example of restricting scope
function print_filename {
    local first_filename=$1
}
print_filename "LOTR.txt" "model.txt"
echo $first_filename
#   * Return values
#       ** It is only meant to determine if the function was a success (0) or failure.
#       ** Can access with $?
#       ** If we want to return something, assign to global
#       ** Or echo wat we want back and capture using shell-within-a-shell.
#       ** Example
function convert_temp {
    echo $(echo "scale=2; ($1 - 32) * 5 / 9" | bc)
}
converted=$(convert_temp 30)
echo "30F in Celsius is $converted C"

# CRON
#   * For scheduling scripts to run at certain times.
#   * To see current cronjobs
crontab -l
#   * No current cronjobs on this machine as of writing these notes.
#   * Creating a cronjob.
#       ** Structure
#           *** minute, hour, day of month, month, day of week, command
#       ** Example
#           *** 5 1 * * * bash myscript.sh
#               **** Will run:
#                   ***** 5 minutes past the hour
#                   ***** 1 AM
#                   ***** every day
#                   ***** every month
#              **** translation:
#                   ****** every day at 1:05am
#       ** More complex example
#           *** 15,30,45 * * * * will run every 15 minutes
#           *** */15 * * * * also will run every 15 minutes.
