name 'apache'

default_source :supermarket

run_list 'apache::default'

cookbook 'apache', path: '.'
