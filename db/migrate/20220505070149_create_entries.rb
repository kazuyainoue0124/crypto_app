class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.text :title
      t.datetime :published
      t.text :content
      t.text :url
      t.integer :feed_id

      t.timestamps
    end
  end
end
