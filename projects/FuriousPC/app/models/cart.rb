class Cart < ActiveRecord::Base

has_many :cart_items
has_many :items, :through => :cart_items

 def add(item_id)
    items = cart_items.where(item_id: item_id)
    item = Item.find item_id
    if items.size < 1
      ci = cart_items.create :item_id => item_id, :amount => 1, :price => item.price
    else
      ci = items.first
      ci.update_attribute :amount, ci.amount + 1
    end
    ci
  end

  def remove(item_id)
    ci = cart_items.where(item_id: item_id).first
    if ci.amount > 1
      ci.update_attribute :amount, ci.amount - 1
    else
      CartItem.destroy ci.id
    end
    ci
  end


def total
  cart_items.inject(0) {|sum, n| n.price * n.amount + sum}
end

end
