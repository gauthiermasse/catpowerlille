class UsersController < ApplicationController
  def show
  	@orders = Order.find_by_user_id(current_user.id)
  	@price = 0
  end
end
