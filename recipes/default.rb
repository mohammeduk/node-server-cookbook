
apt_update

package 'nginx'
package 'nginx-core'
package "nodejs"
package "build-essential"
package "npm"

remote_file '/tmp/nodesource_setup.sh' do
  source 'https://deb.nodesource.com/setup_7.x'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute "nodesource setup" do
  command "sh /tmp/nodesource_setup.sh"
end

execute "pm2 setup" do
  command "npm install -g pm2"
end


# apt_repository "nginx" do
#   uri "https://deb.nodesource.com/setup_7.x"
#   keyserver "keyserver.ubuntu.com"
#   distribution "nodesource_setup.sh"
# end
#
# package 'nginx'
# package 'node'
# # include_recipe 'pm2'
#
# template '/etc/nginx/sites-available/default' do
#   source 'default.erb'
#   mode '0755'
#   owner 'root'
#   group 'root'
#   notifies :restart, "service[nginx]"
# end
#
# service 'nginx' do
#   supports :restart => true, :reload => true, :start => true
#   action [:enable, :start]
# end
