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

end
