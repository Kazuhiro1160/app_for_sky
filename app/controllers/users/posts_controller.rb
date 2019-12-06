class Users::PostsController < Users::BaseController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿が完了しました。'
    else

    end
  end

  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
