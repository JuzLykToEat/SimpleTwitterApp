class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @tweets = Tweet.where(user_id: params[:id]).order(created_at: :desc)
  end
end
