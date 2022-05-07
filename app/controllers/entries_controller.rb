class EntriesController < ApplicationController
  include Pagy::Backend
  before_action :set_entries, only: :index

  def index
    @pagy, @entries = pagy(@entries.order('published desc'), items: 9)
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
