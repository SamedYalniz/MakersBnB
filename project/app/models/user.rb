require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email_address, String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 60

  has n, :spaces, through: Resource
  has n, :booking_requests, through: Resource

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password

  def self.authenticate(email_address, password)
    user = first(email_address: email_address)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end



end
