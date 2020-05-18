# Lab: Chapter 3

> Total Time: 60 minutes

`working directory - /home/centos/code`

## Part 1

Generate the `workstation` cookbook

```
- create a cookbook "workstation"
- check all directories and files to understand cookbook structure
- create a recipe "setup" (using chef generate)
   - file '/etc/motd' with some content
   - package 'tree'
- in cookbooks/workstation/recipes/default.rb
   - include_recipe 'workstation::setup'
- run the cookbook using setup full path
- run the cookbook using runlist
- run the cookbook just by giving cookbook name
```



## Part 2

Generate the `apache` cookbook

```
- create a cookbook "apache"
- check all directories and files to understand cookbook structure
- create a recipe "server" (using chef generate)
   - file '/var/www/html/index.html' with some content
   - package 'httpd'
   - service 'httpd'
- in cookbooks/apache/recipes/default.rb
   - include_recipe 'apache::server'
- run the cookbook using server full path
- run the cookbook using runlist
- run the cookbook just by giving cookbook name
```


Reference server file:

```
package 'httpd'

file '/var/www/html/index.html' do
  content '<h1>Hello, world!</h1>'
end

service 'httpd' do
  action [:enable, :start]
end
```


## Part 3

- Run `cookstyle` and check offenses
- Try to fix few offence


## Part 4

- Run `foodcritic`
- Check offences
