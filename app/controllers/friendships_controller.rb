class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:receiver_id])
    current_user.send_request(user)
    get_friendship = current_user.sending_requests.find_by("sender_id = ? AND receiver_id =?",current_user,user.id)
    get_friendship.status = nil
    get_friendship.save
    redirect_to user
  end

  def destroy
    user = Friendship.find(params[:id]).receiver
    reciever_unfriend_sender= Friendship.my_friends?(params[:user_id], current_user.id)
    if reciever_unfriend_sender
      reciever_unfriend_sender.status = nil unless reciever_unfriend_sender.status.nil?
      current_user.receiving_requests.find_by(sender_id:params[:user_id]).destroy
    end
    current_user.unfriend(user)
    redirect_to user_path(user)
  end

  def edit

  end
  def update
    @accept=current_user.receiving_requests.find_by(sender_id:params[:sender_id])
   
    @accept.update_attribute(:status, params[:status])
    redirect_to users_path(current_user.id)
  end
  
end
