User.seed_once(:id) do |user|
	user.id = 1
	user.nickname =  "testuser"
	user.email = "testuser@example.com"
	user.password = "testuser"
	user.password_confirmation = "testuser"
end