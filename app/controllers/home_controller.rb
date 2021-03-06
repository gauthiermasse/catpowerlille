class HomeController < ApplicationController
        def index
          @array = []
          if !user_signed_in? && Newcart.find_by_session_id(session[:session_id]) == nil
            Newcart.create(session_id: session[:session_id])
            $var_session_id = session[:session_id]
          elsif user_signed_in? && Cart.find_by_user_id(current_user.id) == nil
           cart = Cart.create(user_id: current_user.id)
           cart.items << Newcart.find_by_session_id($var_session_id).items
         end
       end


       def shop     
         @items = Item.all
         if user_signed_in? && Cart.find_by_user_id(current_user.id) == nil
           Cart.create(user_id: current_user.id)
         elsif !user_signed_in? && Newcart.find_by_session_id(session[:session_id]) == nil
          Newcart.create(session_id: session[:session_id])
        end
      end

      def contact
        puts 'home controller'
        p params[:nom]
        p params[:email]
        p params[:description]
        data = params[:body]
        mail = params[:email]
        user = params[:name]
        p data
        p mail
        p user
        ContactMailer.sendus(data,mail,user).deliver_now
      end


      def panier
       unless user_signed_in?
         @cart = Newcart.find_by_session_id(session[:session_id])
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
         @cart = Newcart.find_by_session_id(session[:session_id])
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
         @cart = Newcart.find_by_session_id(session[:session_id])
         @cart.items.delete(Item.find(params[:id]))
         flash[:success] = "a bien été supprimé de votre panier"
         redirect_to panier_path
       else
         current_user.cart.items.delete(Item.find(params[:id]))
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
      flash[:success] = "votre commande a bien été pris en compte, vous recevrez vos photos dans les plus brefs délais."
      redirect_to panier_path


      rescue Stripe::CardError => e
        flash[:error] = e.message
        
      end

      def orders
        @orders = Order.all
      end
end
