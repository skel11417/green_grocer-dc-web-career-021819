require 'pry' 

def consolidate_cart(cart)
  output = {}
  cart.each do |item|
    item.each do |name, info|
      if output.has_key?(name)
        output[name][:count] += 1
      else 
        output[name] = info
        output[name][:count] = 1
      end
    end
  end
  output 
end

def apply_coupons(cart, coupons)
  output = {}
  coupons.each do |coupon|
    item = coupon[:item]
    discounted_item_key = "#{item} W/COUPON"
    if cart.has_key?(item)
      # binding.pry
      if cart[item][:count] >= coupon[:num]
        if output.has_key?(discounted_item_key)
          output[discounted_item_key][:count] += 1
        else
          # create the array
          output[discounted_item_key] = {
            :price => coupon[:cost],
            :count => 1,
            :clearance => cart[item][:clearance]
          }
        end
        cart[item][:count] -= coupon[:num]
      end
    end
  end
  output.merge(cart)
end

def apply_clearance(cart)
  cart.each do |k, v|
    if v[:clearance] == true
      current_price = v[:price]
      v[:price] = (0.8 * current_price).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  total = 0
  cons_cart = consolidate_cart(cart)
  coupons_applied = apply_coupons(cons_cart, coupons)
  clearanced_cart = apply_clearance(coupons_applied)
  clearanced_cart.each do |item, values|
    total += values[:count] * values[:price]
  end
  total > 100 ? total * 0.9 : total
end
