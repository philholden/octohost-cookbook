# encoding: utf-8
#
# Cookbook Name:: octohost
# Recipe:: default
#
# Copyright (C) 2013, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

execute 'apt-get-update' do
  command 'apt-get update'
end

include_recipe 'chef-sugar::default'

include_recipe 'ubuntu_base::default'

include_recipe 'octobase::default'

include_recipe 'docker::default'

include_recipe 'etcd::default'

include_recipe 'redis::default'

include_recipe 'octohost::redis'

include_recipe 'openresty::default'

include_recipe 'octohost::openresty'

include_recipe 'octohost::tentacles'

include_recipe 'gitreceive::default'

include_recipe 'octohost::firewall' unless ec2?

include_recipe 'octohost::private_ip' unless ec2?

include_recipe 'octohost::rackspace' if rackspace?

include_recipe 'octohost::final'
