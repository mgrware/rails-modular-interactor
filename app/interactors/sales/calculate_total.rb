module Sales
  class CalculateTotal < ApplicationInteractor
    def call
      # Simulating price fetching from product/inventory
      unit_price = 100.0 # Example price
      quantity = context.quantity || 1
      
      context.total_price = unit_price * quantity
    end
  end
end
