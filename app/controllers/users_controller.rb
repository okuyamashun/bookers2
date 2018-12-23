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
		# @post_image = @user.profile_image

	end

	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		flash[:notice] = "Book was successfully created."
		redirect_to user_path(@user.id)
		else
	      render :new
	    end
	end

	private

	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
