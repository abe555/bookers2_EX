class UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@book = @user.books
	end

	def edit
		@user = User.find(params[:id])
		if current_user == @user
			flash[:notice] = "Profile was successfully updated!"
			@user = User.find(params[:id])
		else
			flash[:notice] = "error!"
			redirect_to user_path(current_user.id)
		end
	end

	def update
		user = User.find(params[:id])
		if user.update(user_params)
			flash[:notice] = "Profile was successfully updated!"
			redirect_to user_path(user.id)
		else
			flash[:notice] = "error!"
			redirect_to user_path(user.id)
		end
	end

	def index
		@users = User.all
		@user = current_user
	end

	def destroy
		flash[:notice] = "Signed out successfully,"
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
