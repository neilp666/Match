class FriendshipsController < ApplicationController

  before_action :require_login
  before_action :set_friend

  def create
    @inverse_friendship = current_user.inverse_friendships.where(users_id: @friend.id)

    unless @inverse_friendship.blank?
      @friend.accept_match(current_user)
      @match = true
    else
      current_user.request_match(@friend)
    end

    respond_to do |format|
        format.js

  end

  def destroy
    current_user.remove_match(@friend)
    respond_to do |format|
      format.html { redirect_to users_path}
  end

  private

  def set_friend
    @friend = User.find(params[:friend_id])
  end

end
