class UserCardsController < ApplicationController
	
	def index
		@user_cards = UserCard.all
	end 

	def create
		@card = Card.where(card_id: params[:card_id])
		@user = User.find(user_id: params[:user_id])
		@usercard = Usercard.new(card_id: @card_id, user_id: @user_id)
		puts "UserCardsController.create() #{params}"

		result = UserCard.create(user_id: params[:user_id], card_id: params[:card_id])
		
		if @usercard.save
			flash[:notice] = "Card shared!"
		else
			flash[:notice] = "Card failed to share"
		end 
		redirect_to user_cards_path
		# redirect_to user_cards_path
	end 

	def destroy
		puts "NYCDA>>>>>>>>> UserCardsController.destroy() #{params[:id]}"
		uc = UserCard.find(params[:id])
		card_id = uc.card.id
		uc.destroy
		redirect_to current_user
	end

private 

	def user_card_params
		params.require(:user_card).permit(:user_id, :card_id)
	end 
end
