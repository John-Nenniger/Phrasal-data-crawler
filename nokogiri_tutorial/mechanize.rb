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


page.links.each do |link|
  puts link.text
end
