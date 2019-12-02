class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable, :timeoutable, :authentication_keys => [:login_id]

  # 登録時に email を不要にする
  def email_required?
    false
  end
  def email_changed?
    false
  end

  validates :login_id, presence: true, uniqueness: true, length:{maximum:14}

  scope :usr_new, -> (login_id) do
    new(password: login_id,
        memb_login_id: login_id,
        user_grade: 1,
        set_fg: true,
    )
  end
end
