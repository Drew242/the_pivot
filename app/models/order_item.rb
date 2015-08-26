class OrderItem < ActiveRecord::Base
  belongs_to :job
  belongs_to :order

  def sub_total
    item.final_price * quantity
  end

end
