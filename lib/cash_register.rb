class CashRegister
  attr_accessor :cart, :discount, :total, :last_transaction

  def initialize(discount=0)
    @total = 0.00
    @discount = discount
    @cart = []
  end

  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    elsif discount = 0
      "There is no discount to apply."
    end
  end

  def add_item(item, price, quantity=1)
    self.total += price * quantity
    quantity.times {@cart << item}
    self.last_transaction = price * quantity
  end

  def items
    @cart
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end
