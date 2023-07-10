require 'pry'
class CashRegister
    attr_accessor :total, :discount, :last_transaction, :items
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      self.last_transaction = price * quantity
      self.total += self.last_transaction
      quantity.times do
        self.items << title
      end
    end
  
    def apply_discount
      if discount != 0
        discount_amount = (self.total * (discount.to_f / 100)).to_i
        self.total -= discount_amount
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= self.last_transaction
    end
end
#binding.pry
  