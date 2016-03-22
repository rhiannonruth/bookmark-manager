require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id,      Serial
  property :title,   String
  property :url,      String
end
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, ENV['postgres://bnwnkdsnvjwica:WpuLOkn7wNGX3HbGyEF7qP3Qs5@ec2-107-22-246-252.compute-1.amazonaws.com:5432/dui9ucmvtaacc'] ||
                   "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
  DataMapper.finalize.auto_upgrade!
