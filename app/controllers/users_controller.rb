class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
  def receivers
    #users i have sent friend request to and have not approved the request
    @receivers = current_user.receivers

  end
  def senders
    #users who have sent me a request and i have not accepted it 
    @senders = []
    current_user.receiving_requests.each do |cases|
      current_user.senders.each do |u|
        if cases.status == nil
          @senders << u if u.id == cases.sender_id
        end
      end
    end

    @senders

  end
  def destroy
    user = Friendship.find(params[:id]).sender
    current_user.unfriend(user)
    redirect_to user
  end
end
