require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'should have specific column. It has' do
    it 'a status column of boolean' do
      should have_db_column(:status).of_type(:boolean)
    end
    it 'a sender_id column of integer' do
      should have_db_column(:sender_id).of_type(:integer)
    end
    it 'a created_at column of datetime' do
      should have_db_column(:created_at).of_type(:datetime)
        .with_options( null: false)
    end
    it 'a updated_at column of datetime' do
      should have_db_column(:updated_at).of_type(:datetime)
        .with_options( null: false)
    end
    it 'a receiver_id" column of integer' do
      should have_db_column(:receiver_id).of_type(:integer)
    end
  end

  context 'should belong to the' do
    it 'sender' do
      should belong_to(:sender).class_name('User').optional
    end
    it 'receiver' do
      should belong_to(:receiver).class_name('User').optional
    end
  end
  
end
