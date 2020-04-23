require 'pizza_decorator'
class PizzasController < ApplicationController
  before_action :set_pizza, only: [:show, :edit, :update, :destroy]

  # GET /pizzas
  # GET /pizzas.json
  def index
    @pizzas = Pizza.all
  end

  # GET /pizzas/1
  # GET /pizzas/1.json
  def show
  end

  # GET /pizzas/new
  def new
    @pizza = Pizza.new
  end

  # GET /pizzas/1/edit
  def edit
  end

  # POST /pizzas
  # POST /pizzas.json
  def create
    @pizza = Pizza.new()

    @pizza.name = params[:pizza][:name]
    @pizza.cost = params[:pizza][:cost]
    @pizza.size = params[:pizza][:size]

myPizza = BasicPizza.new(6.50, @pizza.size)

# add the extra features to the new pizza
if params[:pizza][:Cheese].to_s.length > 0 then
myPizza = CheeseToppingsDecorator.new(myPizza)
end
if params[:pizza][:ThinCrust].to_s.length > 0 then
myPizza = FlatBaseDecorator.new(myPizza)
end
if params[:pizza][:coke].to_s.length > 0 then 
myPizza = CokeDecorator.new(myPizza)
end
if params[:pizza][:DoubleCheese].to_s.length > 0 then 
myPizza = DoubleCheeseDecorator.new(myPizza)
end

## populate the cost and the description details
@pizza.cost = myPizza.cost
@pizza.description = myPizza.details

    respond_to do |format|
      if @pizza.save
        format.html { redirect_to @pizza, notice: 'Pizza was successfully created.' }
        format.json { render :show, status: :created, location: @pizza }
      else
        format.html { render :new }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizzas/1
  # PATCH/PUT /pizzas/1.json
  def update
    respond_to do |format|
      if @pizza.update(pizza_params)
        format.html { redirect_to @pizza, notice: 'Pizza was successfully updated.' }
        format.json { render :show, status: :ok, location: @pizza }
      else
        format.html { render :edit }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizzas/1
  # DELETE /pizzas/1.json
  def destroy
    @pizza.destroy
    respond_to do |format|
      format.html { redirect_to pizzas_url, notice: 'Pizza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza
      @pizza = Pizza.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pizza_params
      params.require(:pizza).permit(:name, :cost, :description, :size)
    end
end
