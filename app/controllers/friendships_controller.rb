class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:receiver_id])
    puts"##################"
    p current_user
    puts"##################"
    p user
    puts"##################"
    current_user.send_request(user)
    redirect_to user
  end

#   def destroy
    # user = Friendship.find(params[:id]).followed
    # current_user.unfollow(user)
    # redirect_to user
#   end
end
