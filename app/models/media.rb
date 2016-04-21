class Media < ActiveRecord::Base
  belongs_to :album

  validates :album, :image, presence: true
  before_validation :upload_remote_image, on: :create

  mount_uploader :image, ImageUploader

  def upload_remote_image
    self.remote_image_url = self.link if self.link.present?
  end
end
