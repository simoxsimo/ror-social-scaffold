require 'rails_helper'

RSpec.describe 'App routes to', type: :routing do
  it 'the new Friendship controller' do
    should route(:put, '/friendships/1').to('friendships#update', id: 1)
      
  end
  it 'the create Friendship controller' do
    should route(:post, '/friendships').to('friendships#create')
  end
  it 'the delete Friendship controller' do
    should route(:delete, '/friendships/1').to('friendships#destroy', id: 1)
 
  end
  it 'Get senders controller' do
    should route(:get, '/users/1/senders').to('users#senders', id: 1)
 
  end
  it 'Get receivers controller' do
    should route(:get, '/users/1/receivers').to('users#receivers', id: 1)
 
  end
 
end
