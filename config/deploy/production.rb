server '52.199.252.222', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/Tabuchi/.ssh/id_rsa'
