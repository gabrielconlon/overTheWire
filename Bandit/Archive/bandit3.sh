#!/usr/bin/expect -f

set level "bandit3"
set password "UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK"
set debug [lindex $argv 0];

spawn ssh $level@bandit.labs.overthewire.org -p 2220
expect "password: "
send "$password\r"
expect "@bandit"
send "cat inhere/.hidden\r"

if { $debug == "debug" } {
    interact
} else {
    send "exit\r"
    expect eof
}

