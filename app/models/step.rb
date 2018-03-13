class Step < ApplicationRecord
  belongs_to :post
  attachment :step_image
end
