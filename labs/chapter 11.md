
# Lab: Chapter 11

> Total Time: 45 minutes

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

**Policyfile sample (for workstation):**

```
name 'workstation'
default_source :supermarket
run_list 'workstation::default'
cookbook 'workstation', path: 'cookbooks/workstation'
```

<br>

## Part 1 - Workstation policyfile

```
- create policyfile for workstation
- change workstation policyfile content
- create lock file
- push to server with "prod" group
- check policy in server
```


<br>

## Part 2 - Apache policyfile

```
- create policyfile for apache
- change apache policyfile content
- create lock file
- push to server with "prod" group
- check policy in server
- bootstrap FIRST node, name it "node1"
- check node details in server
- set "apache" policy to "node1"
- check node details in server
- apply the policy from the workstation
- check node details in server
- test webserver in the browser
```
