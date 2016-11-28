class Tweet < ApplicationRecord
  belongs_to :user

  validates :body, length: { maximum: 240 }, presence: true
end
