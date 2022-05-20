class BookmarksController < ApplicationController
  before_action :logged_in_user

  def index
    @pagy, @bookmarks = pagy(Bookmark.where(user_id: current_user.id).order('created_at desc'), items: 9)

  end

  def create
    @entry = Entry.find(params[:entry_id])
    bookmark = @entry.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @entry = Entry.find(params[:entry_id])
    bookmark = @entry.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
