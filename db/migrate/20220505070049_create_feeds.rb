class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string :name
      t.text :rss_url

      t.timestamps
    end
  end
end
