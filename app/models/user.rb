require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  attr_accessor :password, :password_confirmation

  before_save :encrypt_password

  field :email, type: String
  field :salt, type: String
  field :fish, type: String

  protected

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.generate_fish(password, self.salt)
  end

end