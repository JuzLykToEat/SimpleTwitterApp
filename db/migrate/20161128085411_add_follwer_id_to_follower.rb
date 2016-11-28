class AddFollwerIdToFollower < ActiveRecord::Migration[5.0]
  def change
    add_column :followers, :follower_id, :integer
  end
end
