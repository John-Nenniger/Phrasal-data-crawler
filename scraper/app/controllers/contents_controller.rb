class ContentsController < ApplicationController
  def create
    urls = get_urls_from_rss
    urls.each do |u|
      params = cbc_content(u)
      sentences = params[0]
      title = params[1]
      sentences.each { |s|
        # puts s.is_a?(String)
        # s is definitley a string
       next if s.presence == nil
        puts s
        art = Article.find(title)
        next if art == nil
        a = Content.new(sentence: s, article_id: art.id)
        a.save!
      }
      #  puts content.errors.full_messages
    end

  end
    # sentences = cbc_content("http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016")
    render plain: "no errors, gj"
end
