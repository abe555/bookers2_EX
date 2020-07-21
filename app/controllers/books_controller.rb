class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.save
		redirect_to show_book_path(@book.id)
	end

	def show
		@book = Book.find(params[:id])
	end

	def index
		@books = Book.all
	end

	def update
	end

	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end


end
