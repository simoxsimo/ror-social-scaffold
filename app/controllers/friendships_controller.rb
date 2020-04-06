class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:receiver_id])
    current_user.send_request(user)
    get_status = Friendship.friend_request(current_user.id, params[:receiver_id]).status
    nil unless get_status.nil?

    redirect_to(request.referrer)
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfriend(user)

    redirect_to(request.referrer)
  end

  def update
    friend_req = Friendship.friend_request(params[:sender_id], current_user.id)
    if params[:friend] == 'true'
      friend_req.accept_friendship
      Friendship.submit_friendship(current_user.id, params[:sender_id])
    else
      friend_req.reject_friendship
    end
    redirect_to(request.referrer) # redirect to the same page, this trick is create a simular behaviour to async call
  end
end
