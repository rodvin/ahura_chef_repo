#
# Cookbook Name:: samba-shared
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package 'samba' do
  action :install
end
service 'smb' do
  action [:enable, :start]
end
directory '/opt/dukkonbot/shared' do
  owner 'dukkonbot'
  group 'dukkonbot'
  mode '777'
  action :create
end

template '/etc/samba/smb.conf' do
  source 'smb.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[smb]', :immediately
end
