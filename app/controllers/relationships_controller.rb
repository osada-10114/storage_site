class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    follow = current_user.relationships.build(following_id: @user.id)
    if follow.save
      flash[:notice] = "フォローしました"
      redirect_to posts_url
    else
      redirect_to posts_url
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    follow = current_user.relationships.find_by!(following_id: @user.id)
    follow.destroy
    flash[:notice] = "フォロー解除しました"
    redirect_to posts_url
  end
end