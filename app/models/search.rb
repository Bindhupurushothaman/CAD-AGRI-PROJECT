class Search < ApplicationRecord

	def search_products
		products = Product.all
#conditions for search
products = products.where(["name Like ?","%#{food}%"]) if food.present?
products = products.where(["category Like ?","%#{category}%"]) if category.present?
products = products.where(["price Like ?","%#{min_price}%"]) if min_price.present?
products = products.where(["price Like ?","%#{max_price}%"]) if max_price.present?
products = products.where(["for_sale Like ?","%#{for_sale}%"]) if for_sale.present?

return products

	end


end
