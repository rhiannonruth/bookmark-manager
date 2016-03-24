require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require_relative 'link'
require_relative 'tag'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
