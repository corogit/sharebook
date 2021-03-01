class User::CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    #投稿に紐づいたコメントを作成
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :ibook_id, :user_id)
  end
end
