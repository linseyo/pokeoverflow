require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :comments
  has_many :answers
  has_many :votes


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(credentials)
    user = User.find_by(email: credentials[:email])
    return user if user && user.password == credentials[:password]
    nil
  end
end
