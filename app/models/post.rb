class Post < ApplicationRecord
	enum category: {棚:0, キッチン:1, トイレ:2, 玄関:3, デスク:4, クローゼット:5, テーブル周り:6, その他:7}
	scope :get_by_category, ->(category) {where(category: category)}
	belongs_to :user
	has_many :comments
	has_many :favorites, dependent: :destroy
	has_many :post_images, dependent: :destroy
	has_many :materials, dependent: :destroy
	accepts_nested_attributes_for :materials, allow_destroy: true
	accepts_attachments_for :post_images, attachment: :image

	def favorited_by? user
    favorites.where(user_id: user.id).exists?
	end

	def self.search(search)
		if search
			Post.where(['post_name LIKE ?', "%#{search}%"])
		else
			Post.all
		end
	end
end
