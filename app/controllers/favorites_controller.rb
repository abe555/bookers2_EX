class FavoritesController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id: book.id)
		#上のと下のは同義？？
		#favorite = Favorite.new(book_id: book.id)
		#favorite.user_id = current_user.id
		favorite.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: book.id)
		#下のコードだと他のユーザーのfavoも消せちゃう
		#favorite = Favorite.find_by(book_id: book.id)
		#favorite.user_id = current_user.id
		favorite.destroy
		redirect_back(fallback_location: root_path)
	end
end
