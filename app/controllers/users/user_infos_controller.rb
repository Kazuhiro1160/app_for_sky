class Users::UserInfosController < Users::BaseController
  def edit
  end

  def update
    @user.update(user_params)
    redirect_to edit_users_user_main_path(@user.id)
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name,
                                   :email, :sex, :user_grade)
    end
end
