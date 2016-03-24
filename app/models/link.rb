class Link

  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :link_address, String
  property :link_name, String

end
