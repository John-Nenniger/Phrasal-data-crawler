class ArticlesController < ApplicationController

  def create
    titles = ["Top Stories", "World", "Canada", "Politics", "Business", "Health", "Arts & Entertainment",
      "Technology & Science", "Offbeat", "Aboriginal", "British Columbia", "Kamloops"]
      # "Calgary", "Edmonton", "Saskatchewan", "Saskatoon", "Manitoba", "Thunder Bay", "Sudbury", "Windsor"]
    urls = get_urls_from_rss(titles)
    # url = "http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016"
    urls.each do |u|
      arr = cbc_article(u);
      title = arr[0];
      if arr[1].class != Date
        date = Date.new(2000,1,1)
      else
        date = arr[1];
      end
      a = Article.new(url: u, title: title, date: date)
      if a.save
        puts '👾👾👾👾👾👾👾'
      else
        puts '🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀'
      end
    end
    render plain: urls
  end

end
