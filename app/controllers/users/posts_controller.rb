class Users::PostsController < Users::BaseController
  layout 'render_users_classic'

  def new
    @post = @user.posts.build
  end

  def show
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿が完了しました。'
      # タイムライン一覧ページにリダイレクト
      #
    else
      redirect_to action: :new
    end
  end

  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
