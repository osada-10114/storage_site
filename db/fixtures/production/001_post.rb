100.times do |i|
	Post.seed_once(:id) do |post|
		post.id = i + 1
		post.post_name =  "#{i + 1}番目の初期データ"
		post.total_price = (i + 1) * 1000
		post.explanation = "#{i + 1}番目の初期データの説明文"
		post.category = 1
		post.tip = "#{i + 1}番目の初期データのコツ"
		post.reason = "#{i + 1}番目の初期データを作成した理由"
		post.user_id = 1
	end
end