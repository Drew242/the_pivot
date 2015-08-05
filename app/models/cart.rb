class Cart
  attr_reader :data

  def initialize(data)
    @data = data || {}
  end

  def items
    @data.map do |item_id, quantity|
      item = Item.find(item_id)
      CartItem.new(item, quantity)
    end
  end

  def add_item(item)
    data[item.id.to_s] ||= 0
    data[item.id.to_s] += 1
  end

  def remove_item(item)
    data[item.id.to_s] -= 1
  end

  def total
    items.inject(0) do |subtotal, cart_item|
      subtotal + (cart_item.price * cart_item.quantity)
    end
  end
end
