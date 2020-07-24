class BooksController < ApplicationController

	before_action :authenticate_user!

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user = current_user
		if @book.save
			flash[:notice] = "Book was successfully updated!"
			redirect_to book_path(@book.id)
		else
			flash[:notice] = "error!"
			redirect_to books_path
		end
	end

	def index
		@books = Book.all
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "Book was successfully updated!"
			redirect_to book_path(@book.id)
		else
			flash[:notice] = "error!"
			render :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params[:book].permit(:title, :body, :user_id)
	end
end
