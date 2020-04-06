require 'rails_helper'

RSpec.describe User, type: :model do
  context 'should have many' do
    it 'posts' do
      should have_many(:posts)
    end
    it 'comments' do
      should have_many(:comments).dependent(:destroy)
    end
    it 'likes' do
      should have_many(:likes).dependent(:destroy)
    end
    it 'request sending' do
      should have_many(:sending_requests).dependent(:destroy).class_name('Friendship').with_foreign_key('sender_id')
    end
    it 'request receiving' do
      should have_many(:receiving_requests).dependent(:destroy).class_name('Friendship').with_foreign_key('receiver_id')
    end
    it 'senders' do
      should have_many(:senders).through(:receiving_requests)
        .source(:sender)
    end
    it 'receivers' do
      should have_many(:receivers).through(:sending_requests)
        .source(:receiver)
    end
  end
end
