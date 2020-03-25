class AddingSenderRecieverToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :sender_id, :integer
    add_column :friendships, :reciever_id, :integer
  end
end
