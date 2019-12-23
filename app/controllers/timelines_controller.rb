class TimelinesController < Users::BaseController
  layout 'render_users_timeline'
  before_action :set_post

  def new
    @grade = Common.user_grade(@user.usr_grade)
    @users = User.where(usr_grade: @user.usr_grade)
    @posts = Post.where(user_id: @users)
    @ids = Common.change_d_id(@posts)
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      #アラート機能
      flash[:success] = '投稿が完了しました。'
      # タイムライン一覧ページにリダイレクト
      redirect_to action: :new
    else
      redirect_to action: :new
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to request.referrer || root_url
  end

  private

  def set_post
    @post = @user.posts.build
  end

  def post_params
    params.require(:post).permit(:content, :img)
  end
end
