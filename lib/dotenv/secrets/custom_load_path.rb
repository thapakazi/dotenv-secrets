# coding: utf-8
application_root_dir = ENV['_APPLICATION_ROOT_DIRECTORY'] || Pathname.getwd().to_s

config_secrets_dir = ENV['_SECRETS_DIR'] || File.join(application_root_dir,'config/.secrets')
common_secrets = ENV['_COMMON_SECRETS'] || File.join(config_secrets_dir, "#{ENV['_COMMON_SECRETS_FILENAME'] || 'common'}")
env_secrets = ENV['_ENV_SECRETS'] || File.join(config_secrets_dir, "#{ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'}")

# copied from the docs: https://github.com/bkeepers/dotenv#sinatra-or-plain-ol-ruby
# By default, load will look for a file called .env in the current working directory.
# Pass in multiple files and they will be loaded in order.
# The first value set for a variable will win.
require 'dotenv'
Dotenv.load(env_secrets, common_secrets)
# now everything will be availabe as env vars 😄
