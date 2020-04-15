module ProductsHelper

	#helper method used for view of all products
	def product_thumbnail product
		img = product.photo.present? ? product.photo : "placeholder.png"
		image_tag img, class: "product-thumb"
	end
end