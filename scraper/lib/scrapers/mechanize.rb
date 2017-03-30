require 'HTTParty'
require 'Nokogiri'
require 'Json'
require 'Pry'
require 'csv'
require 'rubygems'
require 'mechanize'
# require 'xml-simple'

base_url = "http://www.cbc.ca/rss/"

agent = Mechanize.new

page  = agent.get(base_url)

# go through cbc.ca/rss and go to each rss (xml) file and call the next method.
# puts agent.page.link_with(:text => 'Top Stories')

agent.page.link_with(:text => 'Top Stories').click
# now we're in top stories


# this is a mechanize xml file
xml = Nokogiri::XML(agent.page());
# this is a string.
string = agent.page().body

# Where I'm going to put all the urls that I want from this page
top_stories_urls = []

puts xml.css('.collapsible-content')

# puts xml.search(:text => '<link>')

# puts xml.class
# something = XmlSimple.xml_in(xml)
#
# puts something
#
# rss = Nokogiri::HTML(xml)
#
#
#
# puts rss

# puts page().inspect





# puts rsslinks
# rsslinks do |link|
#   puts link.text
# end
