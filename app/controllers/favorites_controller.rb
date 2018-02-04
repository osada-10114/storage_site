class FavoritesController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@post = Post.find(params[:post_id])
		@favorite = current_user.favorites.build(post: @post)

		if @favorite.save
			flash[:notice] = "レシピを保存しました"
			redirect_to posts_url
		else
			redirect_to posts_url
		end
	end

	def destroy
		@favorite = current_user.favorites.find_by!(post_id: params[:post_id])
		@favorite.destroy
		flash[:notice] = "レシピを削除しました"
		redirect_to posts_url
	end
end
