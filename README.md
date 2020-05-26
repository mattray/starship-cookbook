# Starship

Cookbook for installing and configuring the cross-shell prompt  [Starship](https://starship.rs).

## Recipes

The `default` recipe installs Powerline Fonts and Starship. You can specify which user and which shell to add Starship by populating an attribute hash:

    node['starship']['user']['root'] = 'bash'
    node['starship']['user']['mattray'] = 'bash'

## Support

This cookbook currently only supports Debian and Bash.
