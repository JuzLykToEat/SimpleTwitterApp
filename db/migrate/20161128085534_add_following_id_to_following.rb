class AddFollowingIdToFollowing < ActiveRecord::Migration[5.0]
  def change
    add_column :followings, :following_id, :integer
  end
end
