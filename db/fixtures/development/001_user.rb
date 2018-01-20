User.seed_once(:id) do |user|
	user.id = 1
	user.nickname =  "aaa"
	user.email = "a@a"
	user.gender = 0
	user.password = "aaaaaaaa"
	user.password_confirmation = "aaaaaaaa"
end