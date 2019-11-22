class User < ApplicationRecord
  before_save { email.downcase! }
  # REGEX = Regular expression
  # To validate correct email structure
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: {minimum: 6}, allow_nil: true
  mount_uploader :avatar, AvatarUploader

  has_many :lessons, dependent: :destroy

  def lesson_taken(category_id)
    lesson = lessons.find_by(category_id:category_id)
  end
end
