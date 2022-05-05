class EntriesController < ApplicationController
  before_action :set_entries, only: :index

  def index
    @entries = @entries.order('published desc')
  end

  def show
    @entry = Entry.find(params[:id])
  end

   private
    # def set_feed
    #   @feed = Feed.find(params[:id])
    # end

    def set_entries
      @entries = Entry.all
    end
end
