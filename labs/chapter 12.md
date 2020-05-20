# Lab: Chapter 12

> Total Time: 30 minutes

`working directory - /home/centos/chef-repo`

<br>

**Important commands**

```
# generate policyfile
chef generate policyfile <POLICY_NAME>

# install policyfile
chef install <POLICY_NAME>.rb

# push policy to server
chef push <POLICY_GROUP> <POLICY_LOCK_FILE>

# check policy in server
chef show-policy

# check details of a policy in server
chef show-policy <POLICY_NAME> <POLICY_GROUP>

# bootstrap a node
knife bootstrap <IP> -x centos --sudo -i <PEM_FILE_PATH> -N <NODE_NAME>

# show node details
knife node show <NODE_NAME>

# ssh to apply recipe
knife ssh <IP> -m -x centos -i <PEM_FILE_PATH> "sudo chef-client"
```

<br>
**Policyfile for company_web:**

```
name 'company_web'
default_source :supermarket
run_list 'company_web::default'
cookbook 'company_web', path: 'cookbooks/company_web'
cookbook 'apache', path: 'cookbooks/apache'
cookbook 'myiis', path: 'cookbooks/myiis'
```

**default.rb for company_web**

```
case node['platform']
when 'windows'
  include_recipe 'myiis::default'
  edit_resource(:template, 'c:\inetpub\wwwroot\Default.htm') do
    source 'homepage.erb'
    cookbook 'company_web'
end

else
  include_recipe 'apache::default'
  edit_resource(:template, '/var/www/html/index.html') do
    source 'homepage.erb'
    cookbook 'company_web'
  end
end
```

**homepage.erb for company_web**

```
<html>
  <body>
    <h1><%= node['company_web']['company_name'] %> Welcomes You!</h1>
    <h2>PLATFORM: <%= node['platform'] %></h2>
    <h2>HOSTNAME: <%= node['hostname'] %></h2>
    <h2>MEMORY:   <%= node['memory']['total'] %></h2>
    <h2>CPU Mhz:  <%= node['cpu']['0']['mhz'] %></h2>
  </body>
</html>
```


<br>
## Part 1 - company_web

```
- create cookbook name: "company_web"
	chef generate cookbook cookbooks/company_web
- create attribute in company_web, name: "default", and add a property
	default['company_web']['company_name'] = 'My Company'
- In metadata.rb, add 
	depends 'apache'
	depends 'myiis'
- Create a template in company_web, name: "homepage"
	chef generate template cookbooks/company_web homepage
- create policyfile for company_web
	chef generate policyfile company_web
- change company_web policyfile content
- create lock file
	chef install company_web.rb
- push to server with "prod" group
	chef push prod company_web.lock.json
- check policy in chef-server
- set node1 policy to company_web
	knife node policy set node1 prod company_web
- check node details in server
- apply new changes in node1
	knife ssh <IP_node1> -m -x centos -i <aws.pem path> "sudo chef-client"
- confirm changes in a web browser
```


