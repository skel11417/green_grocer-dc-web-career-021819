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
    
  binding.pry
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
