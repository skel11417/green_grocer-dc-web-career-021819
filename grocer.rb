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
