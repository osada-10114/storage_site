User.seed_once(:id) do |user|
	user.id = 1
	user.nickname =  "admin"
	user.email = "admin@example.com"
	user.password = "admin"
	user.password_confirmation = "admin"
	user.admin = true
end