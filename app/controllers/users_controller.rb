class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :destroy, :update]

	def index 
		@user = User.all
	end 

	def new 
		@user = User.new
	end 

	def create 
		@user = User.create(user_params)
		if @user.save 
			session[:user_id] = @user_id
			flash[:notice] = "Welcome to your wallet"
			redirect_to @user
		else 
			flash[:notice] = "Account creation failed"
			redirect_to :back
		end 
	end 

	def show 
		@user = User.find(params[:id])
		@current_user = current_user
	end 

	def edit
		@user = current_user
	end 

	def update 
		@user = User.find(current_user)
			if @user.update(user_params)
				redirect_to user_path
			else 
				redirect_to edit_user_path
			end 
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
	end 

private 

	def user_params 
		params.require(:user).permit(	:fname,
										:lname,
										:password,
										:email,
										:phone,
										:password_confirmation,
										:balance)
	end 

	def set_user 
		begin 
			@user = User.find(params[:id])
		rescue
			flash[:notice] = "That user could not be found"
			redirect_to users_path
		end 
	end 

	# def current_user
	# 	return unless session[:user_id]
	# 	@current_user ||= User.find(session[:user_id])
	# end 
end
