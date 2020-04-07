class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User', optional: true
  belongs_to :receiver, class_name: 'User', optional: true

  validates :sender_id, presence: true, uniqueness: { scope: :receiver_id }

  def self.friend_request(sender, receiver)
    Friendship.find_by(sender_id: sender, receiver_id: receiver)
  end

  def self.submit_friendship(current, my_friend)
    Friendship.create(sender_id: current, receiver_id: my_friend, status: true)
  end

  def accept_friendship
    update_attribute(:status, true)
  end

  def reject_friendship
    destroy
  end
end
