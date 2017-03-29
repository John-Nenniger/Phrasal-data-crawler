require 'HTTParty'
require 'Nokogiri'
require 'Json'
require 'Pry'
require 'csv'


# Islamaphobia Article
page = HTTParty.get('http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016');

parse_page = Nokogiri::HTML(page);

Pry.start(binding);

# This gives the article without most of the garbage as one large string

article = parse_page.css('.story-content').children.text.tr('^A-Za-z0-9., ', '')

# Next up I need to split the paragraph into sentences,
sentences = article.split('.');
# then save each sentence individually.
# sentences.saveintodatabasecomehow
