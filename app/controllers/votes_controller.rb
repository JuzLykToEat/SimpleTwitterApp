class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_or_create_vote

  def like
    if @vote.like == 1
      value = 0
    else
      value = 1
    end

    update_vote(value)
  end

  private

  def find_or_create_vote
    @vote = current_user.votes.find_or_create_by(tweet_id: params[:tweet_id])
  end

  def update_vote(value)
    if @vote
      @vote.update(like: value)
      redirect_to(:back)
    end
  end
end
