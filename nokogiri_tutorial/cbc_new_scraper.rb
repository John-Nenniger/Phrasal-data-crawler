require 'HTTParty'
require 'Nokogiri'
require 'Json'
require 'Pry'
require 'csv'


# Islamaphobia Article  page = HTTParty.get('http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016');

# The new look pluto article
page = HTTParty.get('http://www.cbc.ca/news/technology/pluto-scientists-battle-planet-definition-1.4032382');

parse_page = Nokogiri::HTML(page);

Pry.start(binding);


# for cbc, all story text: parse_page.css('.story-content').children.text
# for new look cbc, all story text: parse_page.css('.story').children.text
