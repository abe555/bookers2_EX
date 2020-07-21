class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])
	end

	def new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to show_user_path(user.id)
	end

	def create
	end

	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
