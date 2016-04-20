class Media < ActiveRecord::Base
  belongs_to :album

  validates :album, :image, presence: true
end
