require 'pry' 

def consolidate_cart(cart)
  # binding.pry
  output = {}
  cart.each do |item|
    item.each do |name, info|
      if output.has_key?(name)
        output[name][:count] += 1
      else 
        # binding.pry 
        output[name] = info
        output[:count] = 1
      end
    end
  end
  output 
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
