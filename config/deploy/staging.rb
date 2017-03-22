set :rails_env, 'staging'
set :unicorn_rack_env, 'staging'
set :log_level, :debug

server '54.178.166.243', user: 'b-team', roles: %w{app} #serverのipとuser名は適宜
set :ssh_options, keys: '~/.ssh/Lemon_TEST_aws_rsa' #ssh_keyの名前は適宜

# set :branch, 'master'

# role :app, %w{b-team@54.178.166.243}
# role :web, %w{b-team@54.178.166.243}
# role :db,  %w{b-team@54.178.166.243}

# server '54.178.166.243', user: 'b-team', roles: %w{web app db}

# set :ssh_options, {
#     keys: [File.expand_path('~/.ssh/Lemon_TEST_aws_rsa')],
#     forward_agent: true,
#     auth_methods: %w(publickey)
# }