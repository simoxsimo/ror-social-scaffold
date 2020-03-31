class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  
  def self.my_friends?(sender, receiver)
    Friendship.find_by(sender_id: sender, receiver_id: receiver)
  end

end
