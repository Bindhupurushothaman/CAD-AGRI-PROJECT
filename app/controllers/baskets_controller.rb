class BasketsController < ApplicationController
	def show 
		@bill_items = current_billing.bill_items
	end
end
