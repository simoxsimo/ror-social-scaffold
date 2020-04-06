class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  # rubocop:disable LineLength
  def timeline_posts
    @timeline_posts ||= Post.all.ordered_by_most_recent.includes(:user).where(user_id: Friendship.where(receiver_id: current_user.id, status: true).or(Friendship.where(sender_id: current_user.id, status: true)).map(&:sender))
  end
  # rubocop:enable LineLength

  def post_params
    params.require(:post).permit(:content)
  end
end
