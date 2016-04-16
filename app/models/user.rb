# User's model

class User < ActiveRecord::Base
  validates :name, presence: true

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
    c.login_field = :email
    c.validate_password_field = true
    c.validates_length_of_password_field_options = { minimum: 8 }
  end
end
