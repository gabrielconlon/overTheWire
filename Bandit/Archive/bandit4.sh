#!/usr/bin/expect -f

set level "bandit4"
set password "pIwrPrtPN36QITSp3EQaw936yaFoFgAB"
set debug [lindex $argv 0];

spawn ssh $level@bandit.labs.overthewire.org -p 2220
expect "password: "
send "$password\r"
expect "@bandit"
send "strings ~/inhere/*\r"

if { $debug == "debug" } {
    interact
} else {
    send "exit\r"
    expect eof
}
