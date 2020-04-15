class SearchesController < ApplicationController
	def new
		@search = Search.new
		#to not duplicate the category display
		@categories = Product.distinct.pluck(:category)
		@for_sales = Product.distinct.pluck(:for_sale)
	end

    def create
	@search = Search.create(search_params)
	redirect_to @search
    end

    def show
	@search = Search.find(params[:id])
    end

    private

    def search_params
	params.require(:search).permit(:food, :category, :min_price, :max_price, :for_sale)
    end

end
