class CartItem < SimpleDelegator
  attr_reader :quantity

  def initialize(item, description=0, price=0, image=0)
    super(item)
    @quantity = quantity
  end
end
