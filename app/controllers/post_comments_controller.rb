class PostCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		comment = PostComment.new(post_comment_params)
		comment.user_id = current_user.id
		comment.book_id = book.id
		comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		book = Book.find(params[:book_id])
		comment = PostComment.find_by(params[:id])
		comment.user_id = current_user.id
		comment.book_id = book.id
		comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
