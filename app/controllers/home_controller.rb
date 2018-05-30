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
    @sum = 0.0
    @cart.items.each do |item|
      @sum += item.price 
    end
    puts @sum
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
    @sum = 0.0
    @cart.items.each do |item|
      @sum += item.price 
    end

    @cart = current_user.cart
    @order = Order.new
    @order.user_id = current_user.id
    @order.items << current_user.cart.items
    @cart.destroy
    @cart = Cart.create(user_id: current_user.id)
    @order.save
  end
end
