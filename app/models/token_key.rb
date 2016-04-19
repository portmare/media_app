class TokenKey < ActiveRecord::Base
  belongs_to :tokenable, polymorphic: true
end
