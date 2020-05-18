# Lab: Chapter 9

> Total Time: 30 minutes

`working directory - /home/centos/code`

## Part 1

Sign-up for manage.chef.io

```
- Create account in manage.chef.io
- Create organization
- Download starter kit
```

## Part 2

Getting ready for chef server labs

```
- Unzip starter kit -> this gives /chef-repo/

** In case, you are using AWS VM as your workstation,
- Download starter kit in your laptop
- scp –i <aws.pem path> <aws.pem path> centos@<IP>:/home/centos/
- scp –i <aws.pem path> <zipped starter kit path> centos@<IP>:/home/centos/
- sudo yum install –y unzip
- unzip <starter kit path> -> this gives /chef-repo/


- Delete chef-repo/cookbooks/starter
- Clone "https://github.com/shekhar2010us/chef-essentials-repo-15"
- Copy all cookbooks from this git repository to chef-repo/cookbooks/
3 cookbooks
	- apache
	- workstation
	- myiis

**** chef-repo with cookbooks worked on day 1 will be your working directory for day2/3 labs
```


## Part 3

chef-server labs for reference

```
# clone this in /home/centos - for reference.
# contains all labs to be done on day 2/3
git clone https://github.com/shekhar2010us/chef-server-example.git
```


