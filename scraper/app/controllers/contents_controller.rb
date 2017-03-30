class ContentsController < ApplicationController
  def create
    sentences = cbc_content("http://www.cbc.ca/news/politics/m-103-islamophobia-motion-vote-1.4038016")
    sentences.each { |s|
      # puts s.is_a?(String)
      # s is definitley a string
      puts s
      a = Content.new(sentence: s, article_id: 2)
      a.save!
     }
    #  puts content.errors.full_messages
    render plain: sentences
  end

end
