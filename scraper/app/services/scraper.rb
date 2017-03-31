# class CBCScraperService
#   def self.cbc_content(url)
#
#   end
# end
require 'HTTParty'
require 'Pry'
require 'Nokogiri'
# def cbc_article(url)
  # base_url = url
  base_url = "http://www.cbc.ca/radio/asithappens/as-it-happens-wednesday-edition-1.4045787/create-a-carrot-that-evokes-larger-social-issues-artist-makes-whatever-her-algorithm-demands-1.4046430?cmp=rss"

  page = HTTParty.get(base_url);

  parse_page = Nokogiri::HTML(page);

  title = parse_page.css('.story-title').text
  if title = ""
    title = parse_page.css('.segment-headline').text
  end
  Pry.start(binding)

  begin
    Date.parse(parse_page.css('.delimited').text)
  rescue
    date = Date.new(2000,1,1)
  end
  #
  # date = Date.parse(parse_page.css('.delimited').text)
  puts title
  puts date
  return [title, date]
# end
