#!/usr/bin/expect -f

set level "bandit2"
set password "CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9"
set debug [lindex $argv 0];

spawn ssh $level@bandit.labs.overthewire.org -p 2220
expect "password: "
send "$password\r"
expect "@bandit"
send "cat 'spaces in this filename'\r"

if { $debug == "debug" } {
    interact
} else {
    send "exit\r"
    expect eof
}
