class BasicPizza
	def initialize(cost,size)
		@cost = cost
		@size = size
		@description = "basic pizza"
	end

	#getter method
	def cost
		return @cost
	end
	def details
		return @description+ ";" +@size+ ": #{@cost}"
	end
end

class PizzaDecorator
	def initialize(real_pizza)
		@real_pizza = real_pizza
		@extra_cost = 0
		@topping = "no extra Topping"
	end

	#override for extra topping cost
	def cost
		return @extra_cost + @real_pizza.cost 
	end

	#override details method for description of extra topping
	def details
		return @topping + "." + @real_pizza.details
	end

end

#a concrete decorator
class CheeseToppingsDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
		@topping = "Cheese Toppings"
		@extra_cost = 2.45
	end

	def details
		return @topping + ": #{@extra_cost} + " + @real_pizza.details
	end
end

#another concrete decorator
class FlatBaseDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
		@topping = "Flat Pizza Base"
		@extra_cost = 1.45
	end

	def details
		return @topping + ": #{@extra_cost} + " + @real_pizza.details
	end
end

#another concrete decorator
class CokeDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
		@topping = "Coke"
		@extra_cost = 3.20
	end

	def details
		return @topping + ": #{@extra_cost} + " + @real_pizza.details
	end
end

#another concrete decorator
class DoubleCheeseDecorator < PizzaDecorator
	def initialize(real_pizza)
		super(real_pizza)
		@topping = "Double Cheese"
		@extra_cost = 1.45
	end

	def details
		return @topping + ": #{@extra_cost} + " + @real_pizza.details
	end
end



