class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    follow = current_user.relationships.build(following_id: @user.id)
    if follow.save
      flash[:notice] = "フォローしました"
      redirect_back(fallback_location: posts_path)
    else
      redirect_to posts_url
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    follow = current_user.relationships.find_by!(following_id: @user.id)
    follow.destroy
    flash[:notice] = "フォローを解除しました"
    redirect_back(fallback_location: posts_path)
  end
end