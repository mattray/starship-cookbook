#
# Cookbook:: starship
# Recipe:: default
#

if debian_platform?
  package "fonts-powerline"
elsif arch_platform?
  package "noto-fonts-emoji"
end

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
  shell = node['starship']['user'][user]['shell']
  if user == 'root'
    path = '/root'
  else
    path = "/home/#{user}"
  end

  if ::File.exist?(path)
    append_if_no_line "Add starship to #{path}/.bashrc" do
      path path+"/.bashrc"
      line 'eval "$(/opt/starship/starship init bash)"'
      only_if { shell == 'bash' }
    end

    # write out the config
    config = node['starship']['user'][user]['config']
    node.rm('starship', 'user', user, 'config') # removes extraneous attributes
    dot_config = path+"/.config"
    unless config.nil?
      directory dot_config do
        owner user
      end

      toml_file dot_config + "/starship.toml" do
        content config
        owner user
      end
    end
  end
end
