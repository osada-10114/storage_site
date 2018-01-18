class Post < ApplicationRecord
	enum category: {棚:0, キッチン:1, トイレ:2, 玄関:3, デスク:4, クローゼット:5, テーブル周り:6, その他:7}
	belongs_to :user
	has_many :post_images, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
end
