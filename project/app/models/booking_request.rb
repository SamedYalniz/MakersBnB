class BookingRequest

  include DataMapper::Resource

property :id, Serial
property :date, String
property :request_status, Boolean

has 1, :user, through: Resource
has 1, :space, through: Resource

end
