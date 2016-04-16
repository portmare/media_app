# User's model

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :password, length: { minimum: 8 }

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
    c.login_field = :email
    c.validate_password_field = true
  end
end
