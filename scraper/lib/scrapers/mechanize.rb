require 'HTTParty'
require 'Nokogiri'
require 'Json'
require 'Pry'
require 'csv'
require 'rubygems'
require 'mechanize'
# require 'xml-simple'

# base_url = "http://www.cbc.ca/rss/"
#
# agent = Mechanize.new
#
# page  = agent.get(base_url)
#
# # go through cbc.ca/rss and go to each rss (xml) file and call the next method.
# # puts agent.page.link_with(:text => 'Top Stories')
#
# agent.page.link_with(:text => 'Top Stories').click
# # now we're in top stories
#
#
# # this is a mechanize xml file
# xml = Nokogiri::XML(agent.page().body);
# # this is a string.
# string = agent.page().body
#
# # Where I'm going to put all the urls that I want from this page
# top_stories_urls = []
# # puts xml.class
# # puts xml
# # this is the level with the story items
#
#
# third_level = xml.first_element_child.first_element_child.children
#
# stories = third_level.slice(17, 55)
# stories = stories.to_a
#
# stories.each do |s|
#   next if s == nil
#   next if s.first_element_child == nil
#   next if s.first_element_child.next == nil
#   next if s.first_element_child.next.next == nil
#   link = s.first_element_child.next.next
#   # puts link.text
#   puts link.text.class
#   top_stories_urls.push(link.text)
# end
# # puts top_stories_urls



# amazing! this finally works ^ ✔️

# this method needs to be altered to be more robust and to also iterate over all of the categories.
def get_urls_from_rss
  # make a robot
  agent = Mechanize.new
  # go to page with many links to rss feeds
  base_url = "http://www.cbc.ca/rss/"
  page  = agent.get(base_url)
  # click on one of the rss feeds (which goes to an xml file)
  agent.page.link_with(:text => 'Top Stories').click
  # get and parse dat xml
  xml = Nokogiri::XML(agent.page().body);
  # create the array you want
  top_stories_urls = [];
  # navigate around this terrible structure
  third_level = xml.first_element_child.first_element_child.children
  # this was done by guess and check...
  stories = third_level.slice(17, 55)
  # turn this nodeset into an array of nodes
  stories = stories.to_a
  # push all the links i want into the array i created earlier (as strings)
  stories.each do |s|
    next if s == nil
    next if s.first_element_child == nil
    next if s.first_element_child.next == nil
    next if s.first_element_child.next.next == nil

    link = s.first_element_child.next.next
    # puts link.text
    top_stories_urls.push(link.text)
  end
  return top_stories_urls
end

# def scrape_with_urls
#   urls = get_urls_from_rss
#   urls.each do |u|
#     cbc_content(u)
#   end
# end
#
# scrape_with_urls






# link = stories[0].first_element_child.next.next
# puts link.text
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
