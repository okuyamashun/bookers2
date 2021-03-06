class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@users = User.all
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "successfully created."
			redirect_to user_path(@user.id)
	    else
			flash[:notice] = "!!!!!!!!error created."
		    render :edit
	   end
	end

	private

	def user_params
		params.require(:user).permit(:username, :introduction, :profile_image)
	end

end

