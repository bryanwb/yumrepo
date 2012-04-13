#
# Cookbook Name:: yumrepo
# Recipe:: elgis
#
# Copyright 2012, Bryan W. Berry (<bryan.berry@gmail.com>)
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

cookbook_file "#{node[:yumrepo][:key_path]}/RPM-GPG-KEY-ELGIS"
major_num = node["platform_version"].to_i.to_s

yum_key "RPM-GPG-KEY-ELGIS" do
  action :add
end

yum_repository "elgis" do
  description "EL GIS"
  key "RPM-GPG-KEY-ELGIS"
  url "http://elgis.argeo.org/repos/#{major_num}/elgis-plus/$basearch"
  action :add
end
