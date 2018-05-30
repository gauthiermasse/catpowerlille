class ContactMailer < ApplicationMailer
	def contact(user, order)
		@client = user
		@commande = order
		puts @commande
		mail(
      		to: user.email,
      		from: 'thplille@gmail.com',
      		subject: 'test'
      	)
	end

	def admin
		mail(
      		to: 'thplille@gmail.com',
      		from: 'thplille@gmail.com',
      		subject: 'test'
      	)
	end
end