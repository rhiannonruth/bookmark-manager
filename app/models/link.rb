require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'



class Link
  include DataMapper::Resource

    has n, :tags, through: Resource

    property :id, Serial
    property :link_address, String
    property :link_name, String

end
