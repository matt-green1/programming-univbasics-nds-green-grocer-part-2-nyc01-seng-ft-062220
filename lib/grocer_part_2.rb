require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  counter = 0
  while counter < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    #below if statement checks to see if the coupon item is in the cart
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:count] -= coupons[counter][:num]
      else
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[counter][:cost] / coupons[counter][:num],
          :clearance => cart_item[:clearance],
          :count => coupons[counter][:num]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end
    end
    counter += 1
  end
  return cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end

=begin
#working except the last advanced case:
def apply_coupons(cart, coupons)
  new_cart = []
  cart.each {|cart_element_hash|
    coupons.each {|coupon_hash|
      if find_item_by_name_in_collection(coupon_hash[:item], cart)
        cart_hash = find_item_by_name_in_collection(coupon_hash[:item], cart)
        if cart_hash[:count] >= coupon_hash[:num]
          coupon_count = (cart_hash[:count] - (cart_hash[:count]%coupon_hash[:num]))
          non_coupon_count = (cart_hash[:count] - coupon_count)
          new_coupon_hash = {
            :item => "#{coupon_hash[:item]} W/COUPON",
            :price => (coupon_hash[:cost]/coupon_hash[:num]),
            :clearance => (cart_hash[:clearance]),
            :count => coupon_count
            }
          new_cart.push(new_coupon_hash)
          
          left_over_hash = {
            :item => coupon_hash[:item],
            :price => cart_hash[:price],
            :clearance => cart_hash[:clearance],
            :count => non_coupon_count
            }
          new_cart.push(left_over_hash)
        elsif !cart_hash[:count] >= coupon_hash[:num]
          new_cart.push(cart_hash)
        end
      discount_list = []
      discount_list.push(coupon_hash[:item])
      discount_list.each{|discount_element|
        if !discount_list.include?(cart_element_hash[:item])
          new_cart.push(cart_element_hash)
        end
      }
      
      end
    }
  }
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  #binding.pry
  #puts "here for testing"
  return new_cart
end

=end