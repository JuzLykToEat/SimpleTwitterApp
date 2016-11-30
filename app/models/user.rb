class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :followers
  has_many :followings
  has_many :votes
  has_many :notifications

  def total_followers
    followers.all.count
  end

  def total_followings
    followings.all.count
  end

  def total_new_notifications
    notifications.where(read: 0).count
  end

end
