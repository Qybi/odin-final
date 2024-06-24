class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post.likes_count += 1
    # Like.create(post_id: @post.id, user_id: current_user.id)
    current_user.liked_posts << @post
    if @post.save!
      redirect_to post_path(@post.id)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.likes_count -= 1
    @post.save!

    current_user.likes.delete_by(post_id: @post.id, user_id: current_user.id)
    redirect_to post_path(@post.id)
  end
end
