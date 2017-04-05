class Api::V1::ContentsController < ApplicationController

  def compare
    puts "$$$$$$$$$$$$$$$$$$$$"
    phrase_params = params.require(:highlighted).permit(:phrase, :content)
    highlighted = phrase_params.to_h[:phrase]
    puts highlighted
    puts "$$$$$$$$$$$$$$$$$$$$"
    matches = Content.where("sentence ILIKE ?", "%#{highlighted}%")
    puts matches
    puts "((((((((((((((((((((((((()))))))))))))))))))))))))"
    render json: matches
  end

end
