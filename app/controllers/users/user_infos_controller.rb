class Users::UserInfosController < Users::BaseController
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
end
