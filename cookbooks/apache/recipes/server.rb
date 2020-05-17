case node[:platform]
when "ubuntu", "debian"
  package "apache2" do
    action :install
  end
when "centos", "redhat", "amazon"
  package "httpd" do
    action :install
  end
end

case node[:platform]
when "ubuntu", "debian"
  service "apache2" do
    action [:start, :enable]
  end
when "centos", "redhat", "amazon"
  service "httpd" do
    action [:start, :enable]
  end
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

#file '/var/www/html/index.html' do
#  content "<h1>Hello, world!</h1>
#    	<h2>PLATFORM: #{node['platform']}</h2>
#    	<h2>HOSTNAME: #{node['hostname']}</h2>
#	<h2>MEMORY:   #{node['memory']['total']}</h2>
#	<h2>CPU Mhz:  #{node['cpu']['0']['mhz']}</h2>"
#end
