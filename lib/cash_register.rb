
require 'pry'
class CashRegister
    attr_accessor :discount, :total, :items


    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = nil
    end


    def add_item(title, price, quantity=1)
        @total += price*quantity
        quantity.times do |i|
            self.items += [title]
        end
        @last_transaction = [title,price,quantity]
    end

    def apply_discount
        self.total = self.total*(1-(self.discount/100.00))
        self.discount!=0 ? "After the discount, the total comes to $#{self.total.round}." : "There is no discount to apply."
    end

    def items
        @items
    end

    def void_last_transaction
        # binding.pry
        @total -= @last_transaction[1]*@last_transaction[2]
        @last_transaction[2].times do |i|
            @items.pop
        end
    end




end