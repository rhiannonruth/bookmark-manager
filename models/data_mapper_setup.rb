require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'link'
require_relative 'tag'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] ||
                 "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize.auto_upgrade!
