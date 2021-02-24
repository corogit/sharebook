class User::LikesController < ApplicationController
  before_action :book_params
  def create
      like = current_user.likes.new(book_id: @book.id)
      like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, book_id: @book.id).destroy
  end

  private
  def book_params
    @book = Book.find(params[:book_id])
  end
end
