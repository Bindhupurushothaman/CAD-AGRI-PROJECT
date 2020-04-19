class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

#to ensure they have created a login before they add the product
before_action :authenticate_user!
before_action :ensure_admin, :only => [:edit, :destroy]

  # GET /products
  # GET /products.json
  def index
    if Rails.env.production?
     @country = request.location.country_code
     @city = request.location.city
     @currency = @country.upcase == "IN" ? "INR" : "EUR" 
    end 
    @product = Product.all
    @products = Product.search(params[:search])
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    #you will face the error when you create the product 
 # 1 error prohibited this product from being saved:
#User must exist
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    #cat_id because we are going to use this for select option in the product page 
    #which admins are going to use to manage the products
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ensure_admin
unless current_user && current_user.admin?
render :text => "Access Error Message", :status => :unauthorized
end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :ingredients, :price, :quantity, :description, :status, :photo, :for_sale, :vegan, :nonveg, :featured, :category, :user_id)
   
  end
end
