json.extract! product, :id, :name, :price, :quantity, :status, :photo, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
