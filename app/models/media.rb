class Media < ActiveRecord::Base
  belongs_to :album

  validates :album, :image, presence: true

  mount_uploader :image, ImageUploader
end
