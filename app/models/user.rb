class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :sending_requests, class_name: 'Friendship', foreign_key: 'receiver_id', dependent: :destroy
  has_many :receiving_requests, class_name: 'Friendship', foreign_key: 'sender_id', dependent: :destroy
  has_many :senders, through: :friendships, source: :sender
  has_many :receivers, through: :friendships, source: :receiver
end
