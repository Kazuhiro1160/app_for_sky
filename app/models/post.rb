class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :replies, class_name: "Comment", foreign_key: "reply_comment_id", dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :img, ImgUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255 }
  validate :img_size


  private

  def img_size
    if img.size > 5.megabytes
      # errors.add(:picture, "should be less than 5MB")
    end
  end
end
