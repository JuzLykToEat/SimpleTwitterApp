class LandingController < ApplicationController
  def index
    following = current_user&.followings&.all
    following_id = [current_user.id]

    following&.each do |following|
      following_id << following.following_id
    end

    @tweets = Tweet.where(user_id: following_id).order(created_at: :desc)
    @tweet = Tweet.new
  end
end
