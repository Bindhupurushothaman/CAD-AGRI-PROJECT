json.extract! pizza, :id, :name, :cost, :description, :size, :created_at, :updated_at
json.url pizza_url(pizza, format: :json)
