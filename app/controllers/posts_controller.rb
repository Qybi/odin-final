class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_post, only: %i[ show edit update destroy ]
  # GET /posts or /posts.json
  def index
    redirect_to new_user_session_path unless user_signed_in?
    @posts = Post.includes(:author).all
  end

  # GET /posts/1 or /posts/1.json
  def show
    redirect_to new_user_session_path unless user_signed_in?
    @post = Post.find(params[:id])
    @author ||= User.find(@post.author_id)&.username
    @is_already_liked = Like.where(post_id: @post.id, user_id: current_user.id).exists?
  end

  # GET /posts/new
  def new
    redirect_to new_user_session_path unless user_signed_in?
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    redirect_to new_user_session_path unless user_signed_in?
    @post = Post.find(params[:id])
    redirect_to posts_path unless current_user.id == @post.author_id
  end

  # POST /posts or /posts.json
  def create
    return unless user_signed_in?
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    return unless user_signed_in?
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    return unless user_signed_in? && current_user == @post.author_id
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :author_id, :likes_count, :comments_count)
    end
end
