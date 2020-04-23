require 'my_bill'
class BillItemsController < ApplicationController
 skip_before_action :verify_authenticity_token, raise: false
 

	def create
		@billing = current_billing
		# retrieve the instance/object of the MyBill class
#bill = MyBill.instance
#bill.billInformation("A new order requested: " + @bill_item)

		@bill_item = @billing.bill_items.new(bill_item_params)
		@billing.save
		session[:billing_id] = @billing.id
	end

	def update
		@billing = current_billing
		@bill_item = @billing.bill_items.find(params[:id])
		@bill_item.update_attributes(bill_item_params)
		@bill_items = @billing.bill_items
	end

	def destroy
		@billing = current_billing
		@bill_item = @billing.bill_items.find(params[:id])
		@bill_item.destroy
		@bill_items = @billing.bill_items
	end

	private
	def bill_item_params
		params.require(:bill_item).permit(:product_id, :quantity)
	end
	
end
