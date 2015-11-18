class CardsController < ApplicationController

	def index
		# @user = User.find(params[:user_id])
		@card = Card.all
		@ownership = UserCard.find_by(user_id: session[:user_id], card_id: @card_id)
	end 

	def new 
		@card = Card.new
	end 

	def create
		@user = User.find(session[:user_id])
		@card = @user.cards.create(card_params)
		# @card = Card.create(card_params)

		if @card.save 
			redirect_to user_path(session[:user_id])
		end 
	end 

	def destroy 
		puts "NYCDA>>>>>>>>> UserCardsController.destroy() #{params[:id]}"
		@card = Card.find(params[:id]).destroy
		if @card.destroy 
			flash[:notice] = "Card deleted"
		else 
			flash[:notice] = "Card failed to delete"
		end
		redirect_to cards_path
	end

	def show
		@card = Card.find(params[:id])
		@ownership = UserCard.find_by(user_id: session[:user_id], card_id: @card_id)
	end 

	def share 

	end 

private 

	def card_params 
	params.require(:card).permit(	:number,
									:card_type,
									:expiration_month,
									:expiration_year
									)
	end 
end
