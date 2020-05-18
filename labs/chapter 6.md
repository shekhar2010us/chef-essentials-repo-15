# Lab: Chapter 6

> Total Time: 60 minutes

`working directory - /home/centos/code`

## Part 1

Use Ohai

```
- Run ohai and check the output
- Run ohai by passing attributes to select columns
e.g. ohai memory, ohai cpu, ohai cloud/public_ipv4

```


## Part 2

Change workstation::setup recipe

```
- Add ipaddress, hostmame, cpu, memory in the "/etc/motd" file
	- copy the above parameters from ohai
- run runlist to apply changes
```


## Part 3

Change workstation::setup recipe

```
- Add ipaddress, hostmame, cpu, memory in the "/etc/motd" file
	- Use node object through string interpolation 
- run runlist to apply changes
```


## Part 4

Change apache::server recipe

```
- Add ipaddress, hostmame, cpu, memory in the "index.html" file
	- Use node object through string interpolation 
- run runlist to apply changes
- test web server in browser
```
