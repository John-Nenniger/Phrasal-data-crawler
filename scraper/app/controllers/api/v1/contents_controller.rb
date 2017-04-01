class Api::V1::ContentsController < ApplicationController

  

  def compare
    highlighted = "This is a test"
    @sentences = Content.sentence.order(created_at: :desc)
    @sentences.each do |sentence|
      if sentence == highlighted
        Content.find
    end
  end

end
