module Sales
  class PlaceOrder
    include Interactor::Organizer

    organize Sales::CalculateTotal,
             Inventory::ReduceStock,
             Sales::PersistOrder
  end
end
