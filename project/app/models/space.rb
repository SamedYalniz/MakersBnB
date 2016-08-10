
class Space
  include DataMapper::Resource
 property :id, Serial
 property :name, String
 property :description, Text
 property :price, String
 property :available_from, Date
 property :available_to, Date


 has 1, :user, through: Resource
 has n, :requests, through: Resource



end
