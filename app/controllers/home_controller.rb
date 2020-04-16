class HomeController < ApplicationController

	#actionview for the missing template for the app_products view
	#loading for all products	 
	#use for home page
  def page
  	@products = Product.all
  	@bill_item = current_billing.bill_items.new
  end


def profile
	@user = User.find(params[:id])
end



end

