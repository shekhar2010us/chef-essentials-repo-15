# Lab: Chapter 15

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
**Policyfile for haproxy:**

```
name 'haproxy'
default_source :supermarket
run_list 'haproxy::default'
cookbook 'haproxy', path: 'cookbooks/haproxy'
```

**default.rb for haproxy**

```
package "haproxy" do
  action :install
end

allwebservers = search('node', 'policy_name:company_web AND policy_group:prod')

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  owner "root"
  group "root"
  mode 0644
  variables(
    :webservers => allwebservers
  )
  notifies :restart, "service[haproxy]"
end

service "haproxy" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end
```

**haproxy.cfg.erb (template) for haproxy**
```
global
        log 127.0.0.1   local0
        log 127.0.0.1   local1 notice
        maxconn 4096
        user haproxy
        group haproxy

defaults
        log     global
        mode    http
        option  httplog
        option  dontlognull
        retries 3
        redispatch
        maxconn 2000
        contimeout      5000
        clitimeout      50000
        srvtimeout      50000
        
# Set up application listeners here.
listen application 0.0.0.0:80
  balance roundrobin
  <% @webservers.each_with_index do |web, n| -%>
    server <%= "webserver#{n}" %> <%= web['cloud']['public_ipv4'] %>:80 weight 1 maxconn 100 check
  <% end -%>

```

<br>
## Part 1 - Second web server

```
- bootstrap the second webserver using node2
	knife bootstrap <IP_node2> -x centos --sudo -i ~/aws.pem -N node2 --policy-name company_web --policy-group prod
- test second web server
```


<br>
## Part 2 - Load balancer

```
- create cookbook name: "haproxy"
	chef generate cookbook cookbooks/haproxy
- Create a template in haproxy, name: "haproxy.cfg"
	chef generate template cookbooks/haproxy haproxy.cfg
- get the content for this template from above
- Change the default.rb (get the content from above)

- create policyfile for haproxy
	chef generate policyfile haproxy
- change haproxy policyfile content
- create lock file
	chef install haproxy.rb
- push to server with "prod" group
	chef push prod haproxy.lock.json
- check policy in chef-server
- bootstrap the third node
	knife bootstrap <IP_node3> -x centos --sudo -i ~/aws.pem -N node3 --policy-name haproxy --policy-group prod
- check node details in server
- confirm changes in a web browser
```


