#!/usr/bin/expect -f

set level [lindex $argv 0];
set debug [lindex $argv 1];
set user "bandit$level"
set password ""
set script ""
# set password "boJ9jbbUNNfktd78OOpsqOltutMc3MY1"

set solutions [open ./banditSolutions "r+"]
set pass [open ./banditPasswords "r+"]
set count 0

while {[gets $solutions line] >= 0} {
    incr count
    if { $level == $count } {
        set script $line
    }
}

while {[gets $pass line] >= 0} {
    incr count
    if { $level == $count } {
        set password $line
    }
}

spawn ssh $user@bandit.labs.overthewire.org -p 2220
expect "password: "
send "$password\r"
expect "@bandit"
send "$script\r"

if { $debug == "debug" || $debug == "d" } {
    interact
} else {
    send "exit\r"
    expect eof
}
