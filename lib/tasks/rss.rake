namespace :rss do
  desc 'RSSを取得するタスク'
  task feeds: [:environment] do
    Feed.all.each do |feed|
      xml= HTTParty.get(feed.rss_url).body
      content = Feedjira.parse(xml)
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(content: entry.content, url: entry.url, published: entry.published)
        p "Newsed Entry - #{entry.title}"
      end
      p "Newsed Feed - #{feed.name}"
    end
  end
end
