
apt_update 'update'

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
