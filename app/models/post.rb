class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :replies, class_name: Comment, foreign_key: :reply_comment_id, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 200 }

end
