# frozen_string_literal: true

lock '~> 3.11.0'

set :use_sudo, false

set :repo_url, 'git@github.com:infeix/90t.git'

append :linked_files, 'config/database.yml', 'config/secrets.yml'

append :linked_dirs,
       'log',
       'tmp/pids',
       'tmp/cache',
       'tmp/sockets',
       'vendor/bundle',
       'public/system',
       'public/uploads'
