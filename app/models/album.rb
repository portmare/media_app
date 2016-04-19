class Album < ActiveRecord::Base
  include Tokenize

  belongs_to :user

  validates :name, :user, presence: true
end
