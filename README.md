# Steps for Ubuntu-18.04 Chef-15 Image


### install updates
```
sudo apt-get update -y
sudo apt-get install -y git wget
```

### install chefdk
```
wget https://packages.chef.io/files/stable/chefdk/4.7.73/ubuntu/18.04/chefdk_4.7.73-1_amd64.deb
sudo dpkg -i chefdk_4.7.73-1_amd64.deb
chef --version
chef env
```

### install docker
```
curl https://get.docker.com/ | bash
sudo docker --version
```

### install docker kitchen gem
```
chef gem install kitchen-docker
```

### provide docker sudo access
```
sudo usermod -a -G docker $USER
```

### exit and log again
```
exit
log back again
```


# Steps for centos-7 Chef-15 Image

### install updates
```
sudo yum update -y
sudo yum install -y git wget
```

### install chefdk
```
wget https://packages.chef.io/files/stable/chefdk/4.7.73/el/7/chefdk-4.7.73-1.el7.x86_64.rpm
sudo rpm -ivh chefdk-4.7.73-1.el7.x86_64.rpm
chef --version
chef env
```

### install docker
```
curl https://get.docker.com/ | bash
sudo docker --version
systemctl status docker
sudo systemctl start docker
```

### install docker kitchen gem
```
chef gem install kitchen-docker
```

### provide docker sudo access
```
sudo usermod -a -G docker $USER
```

### exit and log again
```
exit
log back again
```
