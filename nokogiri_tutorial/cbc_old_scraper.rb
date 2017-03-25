require 'HTTParty'
require 'Nokogiri'
require 'Json'
require 'Pry'
require 'csv'


# Islamaphobia Article
page = HTTParty.get('http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016');



parse_page = Nokogiri::HTML(page);

Pry.start(binding);

article = parse_page.css('.story-content').children.text
# for new look cbc, all story text: parse_page.css('.story').children.text
