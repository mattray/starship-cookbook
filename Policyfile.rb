name 'starship'

default_source :supermarket

run_list 'starship::default'

cookbook 'starship', path: '.'
