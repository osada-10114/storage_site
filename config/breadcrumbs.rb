# 投稿一覧ページ
crumb :posts do
  link "教えて！みんなの収納術", posts_path
end

# 投稿詳細ページ
crumb :post do |post|
	link post.category, posts_path(:category => post.category)
	link post.post_name, post_path(post)
	parent :posts
end

# 新規投稿ページ
crumb :new_post do |post|
	link "新規投稿", new_post_path
	parent :posts
end

# 投稿編集ページ
crumb :edit_post do |post|
	@post =Post.find(params[:id]) 
	link @post.category, posts_path(:category => @post.category)
	link @post.post_name, post_path(@post)
	link "編集画面", edit_post_path
	parent :posts
end

# 会員登録ページ
crumb :new_user do |user|
	link "新規会員登録", new_user_registration_path
	parent :posts
end

# 会員情報編集ページ
crumb :edit_user do |user|
	link "プロフィール変更", edit_user_registration_path
	parent :posts
end

# 会員ログインページ
crumb :session_user do |user|
	link "ログイン", new_user_session_path
	parent :posts
end

# 管理者ログインページ
crumb :session_admin do |admin|
	link "管理者ログイン", new_admin_session_path
	parent :posts
end

# マイページ
crumb :user do |user|
	if current_user == user
		link "マイページ", user_path(user)
	else
		link "#{user.nickname}さんのページ", user_path(user)
	end
	parent :posts
end


# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).