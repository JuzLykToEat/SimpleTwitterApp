class LandingController < ApplicationController
  def index
    following = current_user&.following&.all
    following_id = []

    following&.each do |following|
      following_id << following.following_id
    end

    @tweets = Tweet.where(user_id: following_id).order(created_at: :desc)
  end
end
