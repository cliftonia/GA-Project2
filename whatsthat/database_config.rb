require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'whatsthat'
}

ActiveRecord::Base.establish_connection(options)