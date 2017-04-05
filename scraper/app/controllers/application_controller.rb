class ApplicationController < ActionController::Base
  protect_from_forgery :except => [:compare]
  base_url = "http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016"
  base_url2 = "http://www.cbc.ca/news/business/bank-s-deceptive-titles-put-investments-at-risk-1.4044702"


  def cbc_content(url)
    base_url = url
    # render text: "Yeah gurl"
    page = HTTParty.get(base_url);
    parse_page = Nokogiri::HTML(page);
    # Pry.start(binding);
    title = parse_page.css('.story-title').text
    # date = Date.parse(parse_page.css('.delimited').text)
    # This gives the article without most of the garbage as one large string
    article = parse_page.css('.story-content').children.text.tr('^A-Za-z0-9.,\' -', ' ')
    # Next up I need to split the paragraph into sentences,
    sentences = article.split(/(?<=\.) {2,}(?=[A-Z])/);
    # render text: sentences
    return [sentences, title]
  end

  def cbc_article(url)
    base_url = url

    page = HTTParty.get(base_url);
    parse_page = Nokogiri::HTML(page);

    title = parse_page.css('.story-title').text
    if title == ""
      title = parse_page.css('.segment-headline').text
    end
    begin
      date = Date.parse(parse_page.css('.delimited').text)
    rescue
      date = Date.new(2000,1,1)
    end
    #
    # date = Date.parse(parse_page.css('.delimited').text)
    puts title
    puts date
    puts url
    return [title, date]
  end

  def get_urls_from_rss(rss_titles)
    # make a robot
    agent = Mechanize.new
    # go to page with many links to rss feeds
    base_url = "http://www.cbc.ca/rss/"
    page  = agent.get(base_url)
    # create the array you want
    top_stories_urls = [];
    # click on one of the rss feeds (which goes to an xml file)
    rss_titles.each do |x|

      agent.page.link_with(:text => x).click
      # get and parse dat xml
      xml = Nokogiri::XML(agent.page().body);
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

        page  = agent.get(base_url)
      end
    end
    return top_stories_urls
  end

end
