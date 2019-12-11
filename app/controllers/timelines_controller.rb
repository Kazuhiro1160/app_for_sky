class TimelinesController < Users::BaseController
  layout 'render_users_classic'
  before_action :set_post

  def new
    @users = User.where(usr_grade: @user.usr_grade)
    @posts = Post.where(user_id: @users.ids)
    @grade = Common.user_grade(@user.usr_grade)
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      #アラート機能
      # flash[:success] = '投稿が完了しました。'
      # タイムライン一覧ページにリダイレクト
      redirect_to action: :new
    else
      redirect_to action: :new
    end
  end

  private

  def set_post
    @post = @user.posts.build
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
