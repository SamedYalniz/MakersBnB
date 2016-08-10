class Request
  include DataMapper::Resource

property :id, Serial
property :date, Date

has 1, :user, through: Resource
has 1, :space, through: Resource


end
