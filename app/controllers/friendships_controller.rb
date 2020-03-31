class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:receiver_id])
    current_user.send_request(user)
    status = Friendship.friend_request(current_user.id, params[:receiver_id]).status
    status = nil unless status.nil?
    redirect_to user
  end

  def destroy
    user = Friendship.find(params[:id]).receiver
    reciever_unfriend_sender = Friendship.friend_request(params[:user_id], current_user.id)

    if reciever_unfriend_sender
      reciever_unfriend_sender.status = nil unless reciever_unfriend_sender.status.nil?
      current_user.inverse_friendship(params[:user_id]).destroy # the receiver who is the 'current_user' is the one who deletes Frienship
    end
    current_user.unfriend(user) # the sender is the one who deletes Frienship, by running this method it will automatically deletes the object from Friendship table too

    redirect_to request.referrer # redirect to the same page, this trick is create a simular behaviour to async call
  end

  def update
    friend_req = Friendship.friend_request(params[:sender_id], current_user.id)
    if params[:friend] == 'true'
      friend_req.accept_friendship
    else
      friend_req.reject_friendship
    end
    redirect_to request.referrer # redirect to the same page, this trick is create a simular behaviour to async call
  end
end
