class FollowersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by(id: params[:user_id])
    @follower = @user.followers.build(follower_id: current_user.id)

    @following = current_user.followings.build(following_id: @user.id)

    @notification = @user.notifications.build(body: "#{current_user.username} has followed you!")

    if @follower.save && @following.save && @notification.save
      flash[:success] = "You've followed #{@user.username}"
      redirect_to(:back)
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @follower = @user.followers.find_by(follower_id: current_user.id)

    @following = current_user.followings.find_by(following_id: @user.id)

    if @follower.destroy && @following.destroy
      flash[:success] = "You've unfollowed #{@user.username}"
      redirect_to(:back)
    end
  end
end
