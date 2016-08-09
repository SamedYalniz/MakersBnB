require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email_address, String
  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end
