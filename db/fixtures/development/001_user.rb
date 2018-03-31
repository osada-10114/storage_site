User.seed_once(:id) do |user|
	user.id = 1
	user.nickname =  "admin"
	user.email = "admin@example.com"
	user.password = "admin"
	user.password_confirmation = "admin"
	user.admin = true
end

User.seed_once(:id) do |user|
	user.id = 2
	user.nickname =  "testuser"
	user.email = "testuser@example.com"
	user.password = "testuser"
	user.password_confirmation = "testuser"
	user.admin = false
end