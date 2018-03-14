class Material < ApplicationRecord
	validates :material_quantity, presence: true, if: -> { material_name.present? }
  belongs_to :post
end
