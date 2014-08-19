#
# Cookbook Name:: services
# Recipe:: default
#
# Copyright (C) 2014 Todd Pigram
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# configure Chef Client Service recovery options
batch "recovery" do
  code <<-EOH
  sc failure "chef-client"  actions= restart/180000/restart/180000/restart/180000 reset= 86400
  EOH
end

service "chef-client" do
  provider Chef::Provider::Service::Windows
  action :start 
end



