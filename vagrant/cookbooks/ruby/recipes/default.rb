#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# add the Nginx PPA; grab key from keyserver
apt_repository "ruby-ng" do
  uri "http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C3173AA6"
end

package "ruby-switch" do
  action :install
end

package "ruby1.9.3" do
  action :install
end


bash "" do
  user 'root'
  code <<-EOH
    ruby-switch --list
    ruby-switch --set ruby1.9.1
  EOH
end