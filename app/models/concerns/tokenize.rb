# concern for generate token
module Tokenize
  extend ActiveSupport::Concern

  included do
    has_one :token_key, as: :tokenable
    enum access: { closed: 0, shared: 1 }
    before_validation :generate_token, on: :create

    delegate :token, to: :token_key
  end

  def generate_token
    begin
      token = SecureRandom.urlsafe_base64 
    end while TokenKey.find_by(token: token)
    self.build_token_key(token: token)
  end
end