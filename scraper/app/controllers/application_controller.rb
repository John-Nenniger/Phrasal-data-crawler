class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  base_url = "http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016"


  def cbc_old_scrape
    base_url = "http://www.cbc.ca/news/business/bank-s-deceptive-titles-put-investments-at-risk-1.4044702"
    # render text: "Yeah gurl"
    page = HTTParty.get(base_url);
    parse_page = Nokogiri::HTML(page);
    # Pry.start(binding);

    # This gives the article without most of the garbage as one large string
    article = parse_page.css('.story-content').children.text.tr('^A-Za-z0-9., -', ' ')
    # Next up I need to split the paragraph into sentences,
    sentences = article.split('.');
    render text: sentences
  end
end
