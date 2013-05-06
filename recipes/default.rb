#
# Cookbook Name:: locales
# Recipe:: default
#
# Copyright 2011, Steffen Gebert / TYPO3 Association
#
# Apache2
#

package "locales"

link "/etc/localtime" do
  to "/usr/share/zoneinfo/#{node[:locales][:server_time_zone]}"
end

file "/etc/default/locale" do
  content "LANG=#{node[:locales][:default]}"
end

execute "locale-gen" do
  command "/usr/sbin/locale-gen"
  action :nothing
end

template "/etc/locale.gen" do
    source "locale.gen.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :run, resources(:execute => "locale-gen"), :immediately
end