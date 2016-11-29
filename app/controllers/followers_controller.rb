class FollowersController < ApplicationController
  def create
    @user = User.find_by(id: params[:user_id])
    @follower = @user.follower.build(follower_id: current_user.id)

    @following = current_user.following.build(following_id: @user.id)

    if @follower.save && @following.save
      flash[:success] = "You've followed #{@user.username}"
      redirect_to(:back)
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @follower = @user.follower.find_by(follower_id: current_user.id)

    @following = current_user.following.find_by(following_id: @user.id)

    if @follower.destroy && @following.destroy
      flash[:success] = "You've unfollowed #{@user.username}"
      redirect_to(:back)
    end
  end
end
