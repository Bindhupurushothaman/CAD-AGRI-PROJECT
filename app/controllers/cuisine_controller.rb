class CuisineController < ApplicationController
  def index
  	@home = 'cuisine'
  	@products = Product.all
  end

def search
	#storing in the local variable params
	query = params[:search]
	results = Product.where('name LIKE ?', "%#{query}%")
	#check for filter and searching for equal value
	if params[:filter] == 'Select Filter'
		@products = results
	else
		symbol = params[:filter]
		@products = results.where(symbol => true)
	end
end

end
