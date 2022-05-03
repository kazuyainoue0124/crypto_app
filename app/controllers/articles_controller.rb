class ArticlesController < ApplicationController

  def index
    agent = Mechanize.new
    page = agent.get("https://www.theblockcrypto.com/")
    @title_elements = page.search('article.feedCard h3')  # h2要素を検索
    @lead_elements = page.search('article.feedCard div.font-body')  # リード文要素を検索
    @time_elements = page.search('div.feedCard-meta h5.font-meta')
    @url_elements = page.search('article.feedCard a.feedCard-readButton')
  end

  def detail
    @url = params[:url]
    agent = Mechanize.new
    page = agent.get("https://www.theblockcrypto.com#{@url}")
    @title_elements = page.search('h1.articleTitle')
    @time_elements = page.search('h5.articlePubdate')
    @contents_elements = page.search('div.articleContent div p')
  end
end
