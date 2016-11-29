class Tweet < ApplicationRecord
  has_many :votes
  belongs_to :user

  validates :body, length: { maximum: 240 }, presence: true

  def total_likes
    votes.where(like: 1).count
  end
end
