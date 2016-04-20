# /app/models/token_key.rb
class TokenKey < ActiveRecord::Base
  belongs_to :tokenable, polymorphic: true

  validates :token, :access, presence: true

  enum access: { closed: 0, shared: 1 }
end
