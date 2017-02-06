#
# Cookbook:: devpio
# Provider:: client
#
# Copyright:: 2017, Eduardo Lezcano
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

use_inline_resources

def whyrun_supported?
  true
end

action :remove do
  python_package new_resource.package do
    action :remove
  end
end

action :create do
  include_recipe 'poise-python'

  python_runtime '3'

  python_package new_resource.package do
    version new_resource.version unless \
      new_resource.version.nil?
  end
end