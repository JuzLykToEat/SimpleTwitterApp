class VotesController < ApplicationController
  before_action :find_or_create_vote

  def like
    if @vote.like == 1
      value = 0
      flash.now[:success] = "You've unliked a tweet."
    else
      value = 1
      flash.now[:success] = "You've liked a tweet."
      @liked = "btn-info"
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
      VoteBroadcastJob.perform_later(@vote.comment)
    end
  end
end
