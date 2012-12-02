#
# Cookbook Name:: fgis
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

script "install_program" do
  not_if {File.exists?('/opt/fgis')}
  interpreter "bash"
  user "root"
  cwd "/opt"
  code <<-EOH
    apt-get -y install build-essential
    gem install bundler
    wget https://github.com/vertis/rhok-fgis/archive/master.tar.gz
    tar -zxf master.tar.gz
    mv rhok-fgis-master fgis
    cd fgis
    bundle install
  EOH
end