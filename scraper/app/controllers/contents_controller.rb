class ContentsController < ApplicationController
  def create
    sentences = cbc_old_scrape("http://www.cbc.ca/news/business/bank-s-deceptive-titles-put-investments-at-risk-1.4044702")
    sentences.each { |s|
      # puts s.is_a?(String)
      # s is definitley a string
      puts s
      a = Content.new(sentence: s, article_id: 1)
      a.save!
     }
    #  puts content.errors.full_messages
    render plain: sentences
  end

end
