class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  base_url = "http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016"
  base_url2 = "http://www.cbc.ca/news/business/bank-s-deceptive-titles-put-investments-at-risk-1.4044702"


  def cbc_content(url)
    base_url = url
    # render text: "Yeah gurl"
    page = HTTParty.get(base_url);
    parse_page = Nokogiri::HTML(page);
    # Pry.start(binding);
    title = parse_page.css('.story-title').text
    date = Date.parse(parse_page.css('.delimited').text)
    # This gives the article without most of the garbage as one large string
    article = parse_page.css('.story-content').children.text.tr('^A-Za-z0-9.,\' -', ' ')
    # Next up I need to split the paragraph into sentences,
    sentences = article.split('.');
    # render text: sentences
    return sentences
  end
  def cbc_article(url)
    base_url = url

    page = HTTParty.get(base_url);
    parse_page = Nokogiri::HTML(page);

    title = parse_page.css('.story-title').text
    date = Date.parse(parse_page.css('.delimited').text)

    return [title, date]
  end
end
