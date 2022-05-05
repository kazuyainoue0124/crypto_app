class AddUrlToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :url, :text
  end
end
