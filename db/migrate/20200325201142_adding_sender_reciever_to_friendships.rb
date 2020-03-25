class AddingSenderRecieverToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :sender_id, :integer
    add_column :friendships, :receiver_id, :integer
  end
end
