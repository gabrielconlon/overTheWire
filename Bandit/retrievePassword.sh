#!/usr/bin/expect -f

set fp [open ./banditPasswords "r+"]
set offset [lindex $argv 0];
set count 0

while {[gets $fp line] >= 0} {
    incr count
    if { $offset == $count } {
        puts $line
    }
}

close $fp
