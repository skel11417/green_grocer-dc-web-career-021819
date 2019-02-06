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
  coupon_count = coupons.length
  coupons.each do |coupon|
    item_key = coupon[:item]
    if cart.has_key?(item_key)
      new_item_key = "#{item_key} W/COUPON"
      if output.has_key?[new_item_key]
      output[new_item_key] = {
        :price => coupon[:cost],
        :clearance => cart[item_key][:clearance]
      }
      if output[new_item_key].has_key?(:count)
        output[new_item_key][:count] += 1 
      else
        output[new_item_key][:count] = 1
      end
      cart[item_key][:count] -= coupon[:num]
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
  # code here
end
