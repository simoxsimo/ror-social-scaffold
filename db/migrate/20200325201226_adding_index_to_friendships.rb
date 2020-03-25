class AddingIndexToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_index :friendships, :sender_id
    add_index :friendships, :receiver_id
  end
end
