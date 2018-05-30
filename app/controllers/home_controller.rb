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

  def add
  	@item = Item.find(params[:id])
  	current_user.cart.items << @item
  end

  def remove
  	current_user.cart.items.find(params[:id]).destroy
    flash[:success] = "#a bien été supprimé de votre panier"
    redirect_to panier_path
  end

  def pay
  end
end
