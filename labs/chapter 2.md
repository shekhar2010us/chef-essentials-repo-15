# Lab: Chapter 2

> Total Time: 30 minutes

## Part 1

```
- Login to the AWS machine (Get the IP address from the instructor)
	Username: centos
	Password: aws.pem for mac
				aws.ppk for windows
- Create a directory `/home/centos/code` where all recipes will be stored
```



## Part 2
`Working directory - /home/centos/code`

```
- Create a recipe "hello.rb"
	- to create a file "/home/centos/hello.txt"
	- with content "blah blah blah"
- Use chef-client to apply the recipe
- Test if file is created with the mentioned content
- Manually change the file content
- Use chef-client to apply the recipe again
- Test if file content is back to desired
```
<br>

## Part 3

`Working directory - /home/centos/code`

```
- Create a recipe "setup.rb"
	- to create a file "/etc/motd"
		- with content "blah blah blah”
	- to install package “tree”
- Use chef-client to apply the recipe
- Test if file is created with the mentioned content
- Test if package “tree” is installed
```

