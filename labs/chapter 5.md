# Lab: Chapter 5

> Total Time: 90 minutes

`working directory - /home/centos/code`

### Test docker
```
# test if docker running
systemctl status docker
# if not, start docker
sudo systemctl start docker
# docker version
docker --version
```

## Part 1

Testing apache cookbook for one platform "ubuntu-18.04"

```
- modify kitchen.yml file in apache cookbook
** remove all included workstation recipes, if you have included in apache
- test one by one
	- kitchen create
	- kitchen converge
	- kitchen verify
	- kitchen destroy
* check stdout logs after each step
```

## Part 2

Testing apache cookbook for two platforms; "ubuntu-18.04" and "centos-6"

```
- modify kitchen.yml file in apache cookbook
** remove all included workstation recipes, if you have included in apache
- modify apache server recipe, to add support of centos and ubuntu based webservers for both package and service resources
- test one by one
	- kitchen create
	- kitchen converge
	- kitchen verify
	- kitchen destroy
* check stdout logs after each step
```


## Part 3

Testing apache cookbook for two platforms; "ubuntu-18.04" and "centos-6". Also include workstation dependency

```
- modify kitchen.yml file in apache cookbook
- In apache default recipe:
	> include_recipe 'workstation::setup'
- In apache metadata:
	> depends 'workstation'
- In apache Policyfile.rb
	> cookbook 'workstation', path: '../workstation'

- test one by one
	- kitchen create
	- kitchen converge
	- kitchen verify
	- kitchen destroy
* check stdout logs after each step
```


## Part 4

Use inspec to verify cookbook apache Kitchen

```
- add various test cases and test
- to verify, run "kitchen verify"
* In case, You are not modifying recipes, but only inspec tests, you do not have to create and converge kitchen every time you run "verify". You can run kitchen verify multiple times as long as you have not detroyed the kitchen.

Reference:- https://github.com/shekhar2010us/chef-essentials-repo-15/blob/master/cookbooks/apache/test/integration/default/default_test.rb
```