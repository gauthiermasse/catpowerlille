class UsersController < ApplicationController
  def show
  	p 'voila'
  	@orders = Order.find_by_user_id(current_user.id)
  	p @orders
  	@price = 0
  end
 
end
