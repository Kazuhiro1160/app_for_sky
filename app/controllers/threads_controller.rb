class ThreadsController < Users::BaseController
  layout 'render_users_timeline'
  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments.all
  end

end
