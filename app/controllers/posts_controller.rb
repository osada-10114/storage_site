class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user_or_admin, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.search(params[:search]).page(params[:page]).per(10)
    @new_posts = Post.limit(12).order(created_at: "DESC")
    @categories = Post.all
    if params[:category].present?
      @posts = @posts.get_by_category params[:category]
    end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.includes(:user).find_by(id: params[:id])
    @comments = @post.comments.includes(:user).all
    @comment = @post.comments.build(user_id: current_user.id) if current_user
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.post_images.build
    6.times do 
      @post.materials.build
    end
    @post.steps.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        flash[:notice] = "収納術を作成しました"
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @post }
      else
        flash[:notice] = "入力に誤りがあります"
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:notice] = "収納術を編集しました"
        format.html { redirect_to @post }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    flash[:notice] = "収納術を削除しました"
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:post_name, :total_price, :explanation, :category, :tip, :reason, :user_id, post_images_images: [], materials_attributes:[ :id, :material_name, :material_quantity, :post_id, :_destroy], steps_attributes:[ :id, :step_explanation, :step_image, :post_id, :_destroy])
    end

    def correct_user_or_admin
      post = Post.find(params[:id])
      unless current_user.admin?
        if current_user.id != post.user.id
          flash[:notice] = "権限がありません"
          redirect_to posts_path
        end
      end
    end
end
