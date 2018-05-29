class HomeController < ApplicationController
  def index
  end

  def shop
  	@items = Item.all
  end

  def contact
  end

  def panier
   	@cart = current_user.cart
  end
end
