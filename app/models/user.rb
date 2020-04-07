class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :sending_requests, class_name: 'Friendship', foreign_key: 'sender_id', dependent: :destroy
  has_many :receiving_requests, class_name: 'Friendship', foreign_key: 'receiver_id', dependent: :destroy
  has_many :senders, through: :receiving_requests, source: :sender
  has_many :receivers, through: :sending_requests, source: :receiver

  def send_request(other_user)
    receivers << other_user
  end

  def unfriend(other_user)
    receivers.delete(other_user)
    senders.delete(other_user)
  end

  def friendship(req_id)
    sending_requests.find_by(receiver_id: req_id)
  end

  def inverse_friendship(req_id)
    receiving_requests.find_by(sender_id: req_id)
  end
end
