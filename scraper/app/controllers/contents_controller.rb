class ContentsController < ApplicationController
  def create
    titles = ["Top Stories", "World", "Canada", "Politics", "Business", "Health", "Arts & Entertainment", "Technology & Science", "Offbeat", "Aboriginal", "British Columbia"]
    urls = get_urls_from_rss(titles)
    urls.each do |u|
      params = cbc_content(u)
      sentences = params[0]
      title = params[1]
      sentences.each { |s|
        # puts s.is_a?(String)
        # s is definitley a string
       next if s.presence == nil
        art = Article.where(title: title).first
        next if art == nil
        content = Content.new(sentence: s)
        content.article = art
        if content.save
          puts '👾👾👾👾👾👾👾'
        else
          puts '🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀'
        end
      }
      #  puts content.errors.full_messages
    end
    render plain: "no errors, gj"

  end
    # sentences = cbc_content("http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016")
end
