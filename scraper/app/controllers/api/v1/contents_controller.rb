class Api::V1::ContentsController < ApplicationController

  def compare
    puts "$$$$$$$$$$$$$$$$$$$$"
    phrase_params = params.require(:highlighted).permit(:phrase, :content)
    highlighted = phrase_params[:phrase]
    puts phrase_params
    puts "$$$$$$$$$$$$$$$$$$$$"
    @matches = Content.where("sentence ILIKE ?", "%#{highlighted}%")
    puts @matches

    @matches.each do |match|
      puts match.sentence
      puts match.article.url
    end

  end

end
