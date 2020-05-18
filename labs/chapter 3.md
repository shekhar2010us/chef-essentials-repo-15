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
- run the cookbook using setup.rb full path
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
- run the cookbook using server.rb full path
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
