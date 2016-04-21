class Album < ActiveRecord::Base
  include Tokenize

  belongs_to :user
  has_many :medias

  validates :name, :user, presence: true
end
