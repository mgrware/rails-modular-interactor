module Sales
  class PersistOrder < ApplicationInteractor
    def call
      order = Sales::Order.new(
        customer_name: context.customer_name,
        total_price: context.total_price
      )

      if order.save
        context.order = order
      else
        context.fail!(message: "Failed to persist order: #{order.errors.full_messages.join(', ')}")
      end
    end
  end
end
