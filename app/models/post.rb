class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :replies, class_name: "Comment", foreign_key: "reply_comment_id", dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255 }
  # validate :img_size
  default_scope -> { order(created_at: :desc) }
  mount_uploader :img, ImgUploader
  mount_uploader :file, FilesUploader

  # ユーザーがお気に入りしたかの判定
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  private

  # def img_size
  #   if img.size > 5.megabytes
  #     errors.add(:picture, "should be less than 5MB")
  #   end
  # end
end
