Post.seed_once(:id) do |post|
	post.id = 200
	post.post_name =  "壁面にスペースを確保！ワイヤーラック"
	post.total_price = 400
	post.explanation = "キッチンの壁につっぱり棒をたて、ワイヤーラックと組み合わせることにより、ゴチャゴチャしがちなキッチン周りを綺麗にまとめることが出来ます♪"
	post.category = 1
	post.tip = "つっぱり棒の長さをピッタリ合わせることが重要です。"
	post.reason = "料理をしている時、必要な器具をすぐに取れるようにしたくて考えました。"
	post.user_id = 1
end