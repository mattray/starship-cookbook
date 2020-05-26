#
# Cookbook:: starship
# Recipe:: default
#

package "fonts-powerline"

starship_tgz = "#{Chef::Config[:file_cache_path]}/starship.tar.gz"

# download starship
remote_file starship_tgz do
  show_progress true
  source node['starship']['download_url']
end

archive_file starship_tgz do
  destination "/opt/starship"
end

node['starship']['user'].keys.each do |user|
  shell = node['starship']['user'][user]
  if user == 'root'
    path = '/root'
  else
    path = "/home/#{user}"
  end

  append_if_no_line "Add starship to #{path}/.bashrc" do
    path path+"/.bashrc"
    line 'eval "$(/opt/starship/starship init bash)"'
    only_if { shell == 'bash' }
    only_if { ::File.exist?(path) }
  end

end
