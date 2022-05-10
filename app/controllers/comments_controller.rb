class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントを投稿しました"
      redirect_to "/entries/#{@comment.entry_id}"
    else
      redirect_to "/entries/#{@comment.entry_id}"  # コメント投稿の不具合
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :entry_id)
    end
end
