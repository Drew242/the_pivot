class CartJob < SimpleDelegator
  attr_reader :quantity

  def initialize(job, quantity = 0)
    super(job)
    @quantity = quantity
  end

  def initialize(job)
    super(job)
  end
end
