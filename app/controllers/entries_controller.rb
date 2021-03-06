class EntriesController < ApplicationController
  before_action :set_entries, only: :index

  def index
    @pagy, @entries = pagy(@entries.order('published desc'), items: 9)
  end

  def show
    @entry = Entry.find(params[:id])
    @pagy,@comments = pagy(@entry.comments.all, items: 9)

  end

   private
    # def set_feed
    #   @feed = Feed.find(params[:id])
    # end

    def set_entries
      @entries = Entry.all
    end
end

