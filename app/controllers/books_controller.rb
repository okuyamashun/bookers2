class BooksController < ApplicationController
	def new
		@book = Book.new
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		flash[:notice] = "Book was successfully created."
		redirect_to book_path(@book.id)
		else
		  @books = Book.all
	      render :index
	    end
	end

	def index
		@users = User.all
		@book = Book.new
		@books = Book.all
	end

	def show
		@book1 = Book.find(params[:id])
		@book = Book.new
	end

	def edit
		@book1 = Book.find(params[:id])
	end

	def update
	    book1 = Book.find(params[:id])
		if book1.update(book_params)
		flash[:notice] = "Book was successfully created."
		redirect_to book_path(book1)
		else
	      render :index
	    end
	end

	def destroy
		book1 = Book.find(params[:id])
		book1.destroy
		redirect_to books_path(@books)
	end

    private
	def book_params
		params.require(:book).permit(:title, :opinion)
	end

end
