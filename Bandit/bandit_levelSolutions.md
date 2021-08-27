### Level 6
- bandit6 GID = 11006

### Level 7
```BASH
grep -i ‘millionth’ <filename>
```
- search for non-casesensitive word within filename
	
### Level 8
```BASH
sort file | uniq -u
```
- sort the file and then filter for uniq lines

### Level 9
```BASH
cat -v <filename> | grep -F ‘======‘
```
- read the file with cat (-v means display non-printing characters)
- pipe to grep (search) and search for the ==== as a fixed string (-F)

### Level 10
```BASH
base64 -d <filename>
```
- decode base64

### Level 11
```BASH
cat data.txt | tr ‘n-za-mN-ZA-M’ ‘a-zA-Z’D
```
- read file with cat, then translate 13 chars (A-9 = A+13 = N)
- used ROT - a Cesar style cipher shift

### Level 12
huge serious of:

```BASH 
file <filename>
tar -xvf
gzip -d
bzip2 -d
```

### Level 13
```BASH
nmap -p2220 -Pn bandit.labs.overthewire.org
```
##### Result
	Starting Nmap 7.40 ( https://nmap.org ) at 2021-06-10 23:05 CEST
	Nmap scan report for bandit.labs.overthewire.org (176.9.9.172)
	Host is up.
	rDNS record for 176.9.9.172: static.172.9.9.176.clients.your-server.de
	PORT STATE SERVICE
	2220/tcp filtered netiq
	Nmap done: 1 IP address (1 host up) scanned in 2.06 seconds
	
	```BASH
	ssh bandit14@localhost
	ssh -i ssh localhost -i sshkey.private -l bandit14
	```
- file <sshkey.private> shows that the key can be read by usergroup bandit14
- gets you to the screen to enter in bandit14 passcode

### Level 14
nc -v localhost 30000
bandit14 password is at:
```BASH
cat /etc/bandit_pass/bandit14
````

### Level 15
```openssl s_client -connect localhost:30001```

### Level 16
```nmap -A localhost -p31000-32000 -v```
_-A for extra details and -v for verbose debugging_
- returns:
	- 31046/tcp open unknown
	- 31518/tcp open unknown
	- 31691/tcp open unknown
	- 31790/tcp open unknown
		- ssl/unknown service
		- ```openssl s_client -connect localhost:31790```
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJimZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQJa6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTuDSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbWJGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNXx0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvDKHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBlJ9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovdd8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nCYNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8AvLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnxSatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHdHCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+ExdvtSghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0AR57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDiTtiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCgR8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiuL8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Niblh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkUYOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0bdxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----
	- 31960/tcp open unknown
	
```ssh localhost -i sshkey -l bandit17```
- this gets me a resonse, but asks for a passphrase
	- RSA stored in sskey file
	- must include the RSA BEGIN/END lines

### Level 17
``` diff passwords.new passwords.old ```
output
42c42
< kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd (this is the one)
> w0Yfolrc5bwjS4qw5mq1nnQi6mF03bii
- byebye = solved

### Level 18
``` ssh bandit.labs.overthewire.org -p2220 -l bandit18 'cat readme' ```

### Level 19
using the bandit20-do executable, cat the bandit20 password file
``BASH
./bandit20-do cat /etc/bandit_pass/bandit20
'''
- very confused what the setuid command was needed for

### Level 20
```BASH
nmap localhost
```
 
PORT STATE SERVICE
22/tcp open ssh
113/tcp open ident
30000/tcp open ndmps