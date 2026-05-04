module Inventory
  class ReduceStock < ApplicationInteractor
    def call
      item = context.item
      quantity = context.quantity || 1

      if item.stock >= quantity
        item.stock -= quantity
        if item.save
          context.message = "Stock reduced successfully"
        else
          context.fail!(message: "Failed to update stock: #{item.errors.full_messages.join(', ')}")
        end
      else
        context.fail!(message: "Insufficient stock for #{item.name}")
      end
    end
  end
end
