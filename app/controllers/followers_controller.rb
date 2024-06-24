class FollowersController < ApplicationController
  before_action :authenticate_user!

  def create
    return unless user_signed_in?

    @user = User.find(params[:user_id])
    current_user.followeds << @user
    @user.followers << current_user
  end

  def destroy
    return unless user_signed_in?

    @association = Follower.find_by(follower_id: current_user.id, followed_id: params[:id])
    @association.destroy
  end
end
