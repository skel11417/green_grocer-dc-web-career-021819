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
      output[new_item_key] = {
        :price => coupon[:cost],
        :clearance => cart[item_key][:clearance],
        :count => 1 
      }
      cart[item_key][:count] -= coupon[:num]
    end
  end
  output.merge(cart)
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
