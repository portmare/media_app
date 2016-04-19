class Album < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :token, uniqueness: true

  before_validation :generate_token, on: :create

  enum access: { closed: 0, shared: 1 }

  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64 
    end while self.class.find_by(token: self.token)
  end
end
