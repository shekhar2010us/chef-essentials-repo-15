# Lab: Chapter 4

> Total Time: 60 minutes

`working directory - /home/centos/code`

## Part 1

Using run_list for "workstation" cookbook

```
- run the cookbook using setup.rb full path
- run the cookbook using runlist [workstation::setup]
- in cookbooks/workstation/recipes/default.rb
   - include_recipe 'workstation::setup'
- run the cookbook just by giving cookbook name [workstation]
* check stdout logs after each step
```



## Part 2

Using run_list for "apache" cookbook

```
- repeat same steps as above for "apache" cookbook
```


## Part 3

Using run_list for "apache::server", "workstation::setup" together

```
- run two runlist in an array
```


## Part 4

Using a cookbook as a dependent of another cookbook

```
- in default recipe of apache cookbook, include workstation::setup recipe
- run the cookbook apache
- observe missing_cookbook error
- Add workstation dependency in metadata.rb of the apache cookbook
- Run and test apache cookbook
```
