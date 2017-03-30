require 'HTTParty'
require 'Nokogiri'
require 'Json'
require 'Pry'
require 'csv'
require 'rubygems'
require 'mechanize'
base_url = "http://www.cbc.ca/rss/"

agent = Mechanize.new

page  = agent.get(base_url)



# go through cbc.ca/rss and go to each rss (xml) file and call the next method.
agent.page.link_with(:text => 'Top Stories').click



puts page.inspect





# puts rsslinks
# rsslinks do |link|
#   puts link.text
# end
