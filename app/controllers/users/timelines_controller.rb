class Users::TimelinesController < Users::BaseController
  layout 'render_users_classic'
  def show
    @posts = Post.where(user_id: @user.id)
    @grade = Common.user_grade(@user.usr_grade)
  end
end
