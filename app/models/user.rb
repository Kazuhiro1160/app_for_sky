class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable, :timeoutable, :authentication_keys => [:usr_login_id]

  # 登録時に email を不要にする
  def email_required?
    false
  end
  def email_changed?
    false
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :usr_login_id, presence: true, uniqueness: true, length:{maximum:14}

  scope :usr_new, -> (login_id) do
    new(password: login_id,
        usr_login_id: login_id,
        usr_grade: 1,
        pass_fg: true,
        set_fg: true,
    )
  end
end
