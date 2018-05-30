class HomeController < ApplicationController
  def index
   if user_signed_in? && Cart.find_by_user_id(current_user.id) == nil
     Cart.create(user_id: current_user.id)
   end
 end


 def shop     
   @items = Item.all
 end

 def contact

 end


 def panier
   unless user_signed_in?
     @cart = User.first.cart
   else
     @cart = current_user.cart
   end
   @sum = 0.0
   @cart.items.each do |item|
    @sum += item.price 
  end
end


def add
 unless user_signed_in?
   @cart = User.first.cart
   @item = Item.find(params[:id])
   @cart.items << @item
 else
   @item = Item.find(params[:id])
   current_user.cart.items << @item
 end
 redirect_to shop_path
end

def remove
 unless user_signed_in?
   @cart = User.first.cart
   @cart.items.find(params[:id]).destroy
   flash[:success] = "a bien été supprimé de votre panier"
   redirect_to panier_path
 else

   current_user.cart.items.find(params[:id]).destroy
   flash[:success] = "a bien été supprimé de votre panier"
   redirect_to panier_path
 end
end

def pay
 @cart = current_user.cart
 @sum = 0.0
 @cart.items.each do |item|
  @sum += item.price 
end

@amount = @sum.to_i * 100

customer = Stripe::Customer.create(
  :email => params[:stripeEmail],
  :source  => params[:stripeToken]
  )

charge = Stripe::Charge.create(
  :customer    => customer.id,
  :amount      => @amount,
  :description => 'Rails Stripe customer',
  :currency    => 'eur'
  )
@user = current_user
@cart = current_user.cart
@order = Order.new
@order.user_id = current_user.id
@order.items << current_user.cart.items
@cart.destroy
@cart = Cart.create(user_id: current_user.id)
@order.save
ContactMailer.contact(current_user, current_user.orders.last).deliver_now
ContactMailer.admin(current_user).deliver_now
redirect_to panier_path


rescue Stripe::CardError => e
  flash[:error] = e.message
  
end
end
