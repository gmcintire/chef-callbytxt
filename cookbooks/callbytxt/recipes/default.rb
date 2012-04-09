package "build-essential"
package "git-core"

include_recipe "nginx"
include_recipe "mysql"
include_recipe "nodejs"

user node[:user][:name] do
  password node[:user][:password]
  gid "admin"
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end

