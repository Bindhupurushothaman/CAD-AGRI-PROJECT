class Billing < ApplicationRecord
	has_many :bill_items
	before_save :set_subtotal

	def subtotal
		bill_items.collect {|bill_item| bill_item.valid? ? (bill_item.unit_price*bill_item.quantity) : 0}.sum
	end

	private
	def set_subtotal
		self[:subtotal] = subtotal
	end

end
