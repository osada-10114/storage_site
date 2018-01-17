json.extract! post, :id, :post_name, :total_price, :explanation, :category, :material, :material_quantity, :tip, :reason, :created_at, :updated_at
json.url post_url(post, format: :json)
