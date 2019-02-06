require 'pry' 

def consolidate_cart(cart)
  binding.pry
  output = {}
  cart.each do |item|
    item.each do |name, info|
      if output.has_key?(name)
        output[name]
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
