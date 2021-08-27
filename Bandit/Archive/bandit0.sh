#!/usr/bin/expect -f

######################################################################
# Simple script using the expect clauses to perfrom an SSH login
# by entering "debug" after the script call, you can stay logged into
# the overTheWire shell
######################################################################
set user "bandit0"
set password "bandit0"
set debug [lindex $argv 0];

spawn ssh $user@bandit.labs.overthewire.org -p 2220
expect "password: "
send "$password\r"
expect "@bandit"
send "cat readme\r"

if { $debug == "debug" } {
    interact
} else {
    send "exit\r"
    expect eof
}
