class Users::UserInfosController < Users::BaseController
  before_action :set_already?, only: :edit
  layout 'render_users_modern'
  def edit
  end

  def update
    if @user.update(user_params)
      @user.update(:set_fg => false)
      redirect_to edit_users_user_main_path(@user.id)
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name,
                                   :email, :usr_sex, :usr_grade)
    end

    def set_already?
      if @user.set_fg == false
        redirect_to new_timeline_path
      end
    end
end
