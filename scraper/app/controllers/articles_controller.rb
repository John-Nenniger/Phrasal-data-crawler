class ArticlesController < ApplicationController

  def create
    url = "http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016"
    arr = cbc_article(url);
    title = arr[0];
    date = arr[1];
    a = Article.new(url: url, title: title, date: date)
    a.save!
    render plain: [title, date]
  end

end
