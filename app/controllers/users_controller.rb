class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :admin_only, only: [:index]
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def favorites
  	@user = User.find(params[:id])
  end

  def follows
    @user = User.find(params[:id])
	end

	def followers
    @user = User.find(params[:id])
	end

  def user_destroy
    @user = User.find_by(id: params[:user_id])
    @user.destroy
    redirect_to posts_url
  end

  private
    def admin_only
      unless current_user.admin?
        flash[:notice] = "権限がありません"
        redirect_to posts_path
      end
    end

end
