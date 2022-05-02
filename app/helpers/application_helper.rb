module ApplicationHelper

  # ページ毎の完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "Crypto App for Portfolio"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
