name 'starship'
maintainer 'Matt Ray'
maintainer_email 'chef@mattray.dev'
license 'Apache-2.0'
description 'Installs/Configures Starship command prompt'
version '0.3.0'
chef_version '>= 16.0'

supports 'debian'
supports 'centos'
supports 'arch'

depends 'line', '~> 2.8'
depends 'toml'

source_url 'https://github.com/mattray/starship-cookbook'
issues_url 'https://github.com/mattray/starship-cookbook/issues'
