Admin.seed_once(:id) do |admin|
	admin.id = 1
	admin.nickname =  "admin"
	admin.email = "admin@example.com"
	admin.password = "admin"
	admin.password_confirmation = "admin"
end