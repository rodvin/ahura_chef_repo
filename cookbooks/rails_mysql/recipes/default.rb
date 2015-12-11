#
# Cookbook Name:: rails_mysql
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
rails_mysql = Chef::EncryptedDataBagItem.load("passwords", "rails_mysql")
root_password = rails_mysql['root_password']

mysql_service 'rails' do
  port '3306'
  initial_root_password "#{root_password}"
  action [:create, :start]
end
