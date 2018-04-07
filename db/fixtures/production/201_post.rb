Post.seed_once(:id) do |post|
	post.id = 201
	post.post_name =  "散らかった靴箱もスッキリ！シューズハンガー"
	post.total_price = 100
	post.explanation = "靴箱につっぱり棒をつけて、狭いスペースでも沢山の靴を綺麗に収納することが出来ます。"
	post.category = 3
	post.tip = "靴のサイズを考えて、十分な高さを確保できる位置につっぱり棒をつけることが重要です。"
	post.reason = "靴箱が狭すぎて靴が入りきらなくて困っていたので考えてみました。"
	post.user_id = 1
end